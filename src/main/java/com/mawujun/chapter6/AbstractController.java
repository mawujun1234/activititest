package com.mawujun.chapter6;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.mawujun.util.ActivitiUtils;

/**
 * 抽象Controller，提供一些基础的方法、属性
 *
 * @author henryyan
 */
public abstract class AbstractController {

    protected Logger logger = LoggerFactory.getLogger(getClass());

    //protected ProcessEngine processEngine = null;
    @Autowired
    protected RepositoryService repositoryService;
    @Autowired
    protected RuntimeService runtimeService;
    @Autowired
    protected TaskService taskService;
    @Autowired
    protected HistoryService historyService;
    @Autowired
    protected IdentityService identityService;
    @Autowired
    protected ManagementService managementService;
    @Autowired
    protected FormService formService;

//    public AbstractController() {
//        super();
//        processEngine = ActivitiUtils.getProcessEngine();
//        repositoryService = processEngine.getRepositoryService();
//        runtimeService = processEngine.getRuntimeService();
//        taskService = processEngine.getTaskService();
//        historyService = processEngine.getHistoryService();
//        identityService = processEngine.getIdentityService();
//        managementService = processEngine.getManagementService();
//        formService = processEngine.getFormService();
//    }

}
