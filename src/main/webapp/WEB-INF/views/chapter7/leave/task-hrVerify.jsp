<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.mawujun.chapter7.*,org.activiti.engine.task.Task"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/common/global.jsp"%>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-base-styles.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/common/plugins/timepicker.css">
	<%
Task task=(Task)request.getAttribute("task");
Leave leave=(Leave)request.getAttribute("leave");
%>
	<title>请假--<%=task.getName() %></title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/chapter7/leave/task/complete/<%=task.getId() %>" class="form-horizontal" method="post" onsubmit="beforeSend()">
		<input type="hidden" name="id" value="<%=leave.getId() %>" />
		<fieldset>
			<legend><small><%=task.getName() %></small></legend>
			<div class="control-group">
				<label for="loginName" class="control-label">申请人:</label>
				<div class="controls"><%=leave.getUserId() %></div>
			</div>
			<div class="control-group">
				<label for="loginName" class="control-label">申请时间:</label>
				<div class="controls"><%=leave.getApplyTime() %></div>
			</div>
			<div class="control-group">
				<label for="loginName" class="control-label">请假类型:</label>
				<div class="controls"><%=leave.getLeaveType() %></div>
			</div>
			<div class="control-group">
				<label for="name" class="control-label">开始时间:</label>
				<div class="controls"><%=leave.getStartTime() %></div>
			</div>
			<div class="control-group">
				<label for="plainPassword" class="control-label">结束时间:</label>
				<div class="controls"><%=leave.getEndTime() %></div>
			</div>
			<div class="control-group">
				<label for="groupList" class="control-label">请假原因:</label>
				<div class="controls"><%=leave.getReason() %></div>
			</div>
			<div class="control-group">
				<label class="control-label" for="hrApproved">是否继续申请：</label>
				<div class="controls">
					<select id="hrApproved" name="p_B_hrApproved">
						<option value="true">同意</option>
						<option value="false">拒绝</option>
					</select>
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn"><i class="icon-ok"></i>完成任务</button>
			</div>
		</fieldset>
	</form>
</body>
</html>