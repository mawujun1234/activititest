<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.mawujun.chapter7.*,org.activiti.engine.task.Task"%>
<!DOCTYPE html>
<html>
<head>
	<%
Task task=(Task)request.getAttribute("task");
Leave leave=(Leave)request.getAttribute("leave");
%>
	<%@ include file="/common/global.jsp"%>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-base-styles.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/common/plugins/timepicker.css">
	<title>请假申请--<%=task.getName() %></title>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/plugins/bootstrap-timepicker.js"></script>
	<script type="text/javascript">
	$(function() {
		$('.datepicker').datepicker();
		$('.time').timepicker({
			minuteStep: 10,
            showMeridian: false
		});
	});

	function beforeSend() {
		$('input[name=p_DT_realityStartTime]').val($('#realityStartDate').val() + ' ' + $('#realityStartTime').val());
		$('input[name=p_DT_realityEndTime]').val($('#realityEndDate').val() + ' ' + $('#realityEndTime').val());
	}
	</script>
</head>
<body>
	<form action="<%=request.getContextPath() %>/chapter7/leave/task/complete/<%=task.getId() %>" class="form-horizontal" method="post" onsubmit="beforeSend()">
		<input type="hidden" name="id" value="<%=leave.getId() %>" />
		<input type="hidden" name="p_DT_realityStartTime" />
		<input type="hidden" name="p_DT_realityEndTime" />
		
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
				<label for="name" class="control-label">实际开始时间:</label>
				<div class="controls">
					<input type="text" id="realityStartDate" value="<%=leave.getStringStartDate() %>" class="datepicker input-small" data-date-format="yyyy-mm-dd" />
					<input type="text" id="realityStartTime" value="<%=leave.getStringStartTime() %>" class="time input-small" />
				</div>
			</div>
			<div class="control-group">
				<label for="plainPassword" class="control-label">实际结束时间:</label>
				<div class="controls">
					<input type="text" id="realityEndDate" value="<%=leave.getStringEndDate() %>" class="datepicker input-small" data-date-format="yyyy-mm-dd" />
					<input type="text" id="realityEndTime" value="<%=leave.getStringEndTime() %>" class="time input-small" />
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn"><i class="icon-ok"></i>完成任务</button>
			</div>
		</fieldset>
	</form>
</body>
</html>