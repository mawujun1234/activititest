package com.mawujun.chapter10;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;

public class ActivityBehavior1 implements JavaDelegate {

	@Override
	public void execute(DelegateExecution execution) {
		System.out.println("==========================================");
		System.out.println("==========================================");
		System.out.println("==========================================");
		System.out.println("==========================================");
		System.out.println("==========================================");
		System.out.println("==========================================");
		System.out.println("==========================================");
		System.out.println("==========================================");
		System.out.println("==========================================");
		System.out.println("当前活动的id:"+execution.getCurrentActivityId());
		// TODO Auto-generated method stub
		
	}

	

}
