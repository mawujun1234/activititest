package com.mawujun.user;

import static org.junit.Assert.*;


import java.util.List;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.test.ActivitiRule;
import org.junit.Rule;
import org.junit.Test;

public class IdentifyServiceTest {
	//使用默认的activiti.cfg.xml作为初始化内容
	@Rule
	public ActivitiRule activitiRule=new ActivitiRule();
	//用户管理的API演示
	@Test
	public void testUser() {
		IdentityService identifyService=activitiRule.getIdentityService();
		//创建一个用户
		User user=identifyService.newUser("henryyan");
		user.setFirstName("Henry");
		user.setLastName("Yan");
		user.setEmail("yanhonglei@gmail.com");
		//保存用户到数据库
		identifyService.saveUser(user);
		//验证用户是否保存成功
		User userInDb=identifyService.createUserQuery().userId("henryyan").singleResult();
		assertNotNull(userInDb);
		
		//删除用户
		identifyService.deleteUser("henryyan");
		//验证删除是否成功
		userInDb=identifyService.createUserQuery().userId("henryyan").singleResult();
		assertNull(userInDb);
		
	}
	
	@Test
	public void testGroup() {
		IdentityService identifyService=activitiRule.getIdentityService();
		Group group=identifyService.newGroup("deptLeader");
		group.setName("部门领导");
		group.setType("assignment");
		//如果组已经存在就会更新，否则就是创建一个新的组
		identifyService.saveGroup(group);
		List<Group> grouplist=identifyService.createGroupQuery().groupId("deptLeader").list();
		assertEquals(1,grouplist.size());
		
		
		identifyService.deleteGroup("deptLeader");
		grouplist=identifyService.createGroupQuery().groupId("deptLeader").list();
		assertEquals(0,grouplist.size());
		
	}
	
	@Test
	public void testUserAndGroupMemership() {
		IdentityService identifyService=activitiRule.getIdentityService();
		
		Group group=identifyService.newGroup("deptLeader");
		group.setName("部门领导");
		group.setType("assignment");
		identifyService.saveGroup(group);
		
		User user=identifyService.newUser("henryyan");
		user.setFirstName("Henry");
		user.setLastName("Yan");
		user.setEmail("yanhonglei@gmail.com");
		identifyService.saveUser(user);
		
		//吧用户henryyan加入到组deptLeader中
		identifyService.createMembership("henryyan", "deptLeader");
		
		//查询属于deptLeader的用户
		User useringroup=identifyService.createUserQuery().memberOfGroup("deptLeader").singleResult();
		assertNotNull(useringroup);
		assertEquals("henryyan",useringroup.getId());
		//查询henryyan所属组
		Group groupContainHenryyan=identifyService.createGroupQuery().groupMember("henryyan").singleResult();
		assertNotNull(groupContainHenryyan);
		assertEquals("deptLeader",groupContainHenryyan.getId());
		
	}

}
