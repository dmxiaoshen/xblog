package com.dmxiaoshen.blog.common.quartz;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class QuartzJob {
	
	@Scheduled(cron="*/10 * * * * ?")
	public void sy(){
		System.out.println("quartz job execute -------"+System.currentTimeMillis());
	}

}
