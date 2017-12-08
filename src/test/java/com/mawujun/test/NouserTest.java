package com.mawujun.test;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.engine.test.Deployment;
import org.junit.Test;

import com.mawujun.AbstractTest;

/**
 * 购买办公用品流程测试
 *
 * @author henryyan
 */
//@ContextConfiguration("classpath:applicationContext-test-chapter10.xml")
public class NouserTest extends AbstractTest {

    @Test
    @Deployment(resources = {"com/mawujun/test/nouser.bpmn"})
    public void testOne() throws Exception {

        identityService.setAuthenticatedUserId("henryyan");
        Map<String,Object> variables=new HashMap<String,Object>();
        variables.put("nouser", "aaaaaa");

        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("nouser",variables);
        Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateUser("aaaaaa").singleResult();
        assertNotNull(task);
        
        //还是需要同步数据到activiti，因为当指定候选组的时候，一个用户属于候选组的话，是查询不到的，如果都直接指定用户的话倒是可以的

//        Task task = taskService.createTaskQuery().processInstanceId(processInstance.getId()).taskCandidateGroup("deptLeader").singleResult();
//        taskService.claim(task.getId(), "bill");
//
//        Map<String, Object> variables = new HashMap<String, Object>();
//        List<String> users = Arrays.asList("user1", "user2", "user3");
//        variables.put("users", users);
//        taskService.complete(task.getId(), variables);
//
//        for (String user : users) {
//            long count = taskService.createTaskQuery().taskAssignee(user).count();
//            assertEquals(1, count);
//        }
    }
}
