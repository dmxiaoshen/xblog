package com.dmxiaoshen.blog.web.article.web;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dmxiaoshen.blog.common.article.entity.Article;
import com.dmxiaoshen.blog.common.article.service.ArticleService;
import com.dmxiaoshen.blog.common.dict.service.DictService;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	private  final Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	private ArticleService articleService;
	@Autowired
	private DictService dictService;

    @RequestMapping("/download/{type}/{filePath}")
    public void download(@PathVariable("type")String type,@PathVariable("filePath")String filePath,HttpServletResponse res,HttpServletRequest request) throws IOException {
        OutputStream os = res.getOutputStream();
        try {
            res.reset();
            String fileName = filePath+"."+type;
            //res.setHeader("Content-Disposition", "attachment; filename="+filePath+"."+type+"");
            res.setContentType("application/octet-stream; charset=utf-8");
            //res.setContentType("application/force-download");
            //res.setContentType("application/vnd.ms-excel");
            String agent = request.getHeader("User-Agent");
            if (agent != null) {
                agent = agent.toLowerCase();
                if (agent.indexOf("firefox") != -1) {
                    // 解决空格会截断问题
                    fileName = "=?UTF-8?B?" + (new String(Base64.encodeBase64(fileName.getBytes("UTF-8")))) + "?=";
                } else if (agent.indexOf("msie") != -1) {
                    fileName = URLEncoder.encode(fileName, "UTF-8");
                    fileName = fileName.replaceAll("\\+", "%20"); // 解决编码后空格变+号的情况
                } else if (agent.indexOf("chrome") != -1) {
                    fileName = "=?UTF-8?B?" + (new String(Base64.encodeBase64(fileName.getBytes("UTF-8")))) + "?=";
                } else {
                    fileName = "=?UTF-8?B?" + (new String(Base64.encodeBase64(fileName.getBytes("UTF-8")))) + "?=";
                }
            }

            res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
            
            
            
            os.write(FileUtils.readFileToByteArray(new File("F:/upload/"+filePath+"."+type)));
            os.flush();
        } finally {
            if (os != null) {
                os.close();
            }
        }
    }

	
	@RequestMapping(value = "/fileUpload")
	@ResponseBody
	public Map<String,Object> uploadApk(
			@RequestParam(value = "reFile") MultipartFile reFile,
			HttpServletRequest request, HttpServletResponse response) {
		String originFileName = reFile.getOriginalFilename();
		Map<String,Object> resMap = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(originFileName)){				
		try {
			FileUtils.copyInputStreamToFile(reFile.getInputStream(),
					new File("F:/upload/", originFileName));
			resMap.put("msg", "success");
			resMap.put("fileName", originFileName);
		} catch (IOException e) {			
			e.printStackTrace();
		}
		
		}else{
			resMap.put("msg", "文件不能为空");
		}
		
		
		//Map<String,Object> resMap = new HashMap<String,Object>();
//		if (apkFile != null) {
//			//获取保存的路径，
//			String realPath = request.getSession().getServletContext()
//					.getRealPath("/upload/apk");
//			if (apkFile.isEmpty()) {
//				// 未选择文件
//				resMap.put("status", StatusConstants.STATUS_PARM_IS_EMPTY);
//			} else{
//				// 文件原名称
//				String originFileName = apkFile.getOriginalFilename();
//				try {
//					//这里使用Apache的FileUtils方法来进行保存
//					FileUtils.copyInputStreamToFile(apkFile.getInputStream(),
//							new File(realPath, originFileName));
//					resMap.put("status",StatusConstants.STATUS_OK);
//				} catch (IOException e) {
//					System.out.println("文件上传失败");
//					resMap.put("status", StatusConstants.STATUS_EXECPTION);
//					e.printStackTrace();
//				}
//			}
//
//		}
		//resMap.put("msg", "success");
		//return "success";
		return resMap;
	}
	
	@RequestMapping(value = "/index")
	public String adminIndex(ModelMap model) {
		return "/article/index";
	}
	
	@RequestMapping(value = "/view")
	public String articleView(ModelMap model,String id) {
		if(StringUtils.isNotBlank(id)){
			Article article = articleService.get(id.trim());
			model.put("article",article );
		}
		return "/article/view";
	}
	
	@RequestMapping(value = "/add")
	public String addPage(ModelMap model,String id) {
//		List<Dict> categoryList = dictService.findByType(DictConstants.CATEGORY);
//		model.put("categoryList", categoryList);
//		model.put("defaultCate", categoryList.get(0));
//		if(StringUtils.isNotBlank(id)){
//			Article article = articleService.get(id.trim());
//			model.put("article",article );
//			model.put("defaultCate", article.getCategory());
//		}
		
		return "/article/add";
	}
	
	@RequestMapping(value="/save")
	@ResponseBody
	public String save(Article article){
		articleService.saveOrUpdate(article);
		return "success";
	}
}
