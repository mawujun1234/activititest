package com.mawujun;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.RepositoryService;

public class Test {

	public static void main(String[] args) throws IOException {
		ProcessEngine processEngine = ProcessEngineConfiguration.createProcessEngineConfigurationFromResourceDefault().buildProcessEngine();
		RepositoryService repositoryService=processEngine.getRepositoryService();
		
//		// TODO Auto-generated method stub
//		ProcessDefinitionQuery pdq = repositoryService.createProcessDefinitionQuery();
//        ProcessDefinition pd = pdq.processDefinitionId(processDefinitionId).singleResult();

        // 通过接口读取
        InputStream resourceAsStream = repositoryService.getResourceAsStream("22501", "userAndGroupInUserTask.userAndGroupInUserTask.png");
        //File png=new File("D:\\aa.png");
        FileOutputStream fos=new FileOutputStream("D:\\aa.png");


        // 输出资源内容到相应对象
        byte[] b = new byte[1024];
        int len = -1;
        while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
        	fos.write(b, 0, len);
        }

	}

}
