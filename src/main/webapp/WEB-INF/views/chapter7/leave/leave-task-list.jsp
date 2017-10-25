<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,com.mawujun.chapter7.*"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/common/global.jsp"%>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-base-styles.jsp" %>
	<title>请假流程待办任务列表--chapter7</title>

	<script src="${ctx }/js/common/jquery.js" type="text/javascript"></script>
</head>
<body>
<% String message=(String)request.getAttribute("message");
if(message!=null){
%>
<div id="message" class="alert alert-success"><%=message %></div>
		<!-- 自动隐藏提示信息 -->
		<script type="text/javascript">
		setTimeout(function() {
			$('#message').hide('slow');
		}, 5000);
		</script>
<%	
}
%>
	<table width="100%" class="table table-bordered table-hover table-condensed" style="margin-top: 5em;">
		<thead>
			<tr>
				<th>申请人</th>
				<th>类型</th>
				<th>请假时间</th>
				<th>请假原因</th>
				<th>任务ID</th>
				<th>任务名称</th>
				<th>流程实例ID</th>
				<th>流程定义ID</th>
				<th>任务创建时间</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
		List<Leave> records=(List<Leave>)request.getAttribute("records");
		for(Leave leave:records){
		%>
			<tr>
				<td><%=leave.getUserId() %></td>
				<td><%=leave.getLeaveType() %></td>
				<td><%=leave.getStartTime() %>至<br/><%=leave.getEndTime() %></td>
				<td><%=leave.getReason() %></td>
				<td><%=leave.getTask().getId() %></td>
				<td><%=leave.getTask().getName() %></td>
				<td><%=leave.getTask().getProcessInstanceId() %></td>
				<td><%=leave.getTask().getProcessDefinitionId() %></td>
				<td><%=leave.getTask().getCreateTime() %></td>
				<td>
				<%
				if(leave.getTask().getAssignee()==null){
				%>
					<a class="btn" href="claim/<%=leave.getTask().getId() %>"><i class="icon-eye-open"></i>签收</a>
				<%
				}
				%>
				<%
				if(leave.getTask().getAssignee()!=null){
				%>
					<a class="btn" href="view/<%=leave.getTask().getId() %>"><i class="icon-user"></i>办理</a>
				<%	
				}
				%>
				</td>
			</tr>
		<%	
		}
		%>
		<!--  
			<c:forEach items="${records }" var="leave">
				<tr>
					<td>${leave.userId}</td>
					<td>${leave.leaveType}</td>
					<td>${leave.startTime}至<br/>${leave.endTime}</td>
					<td>${leave.reason}</td>
					<td>${leave.task.id }</td>
					<td>${leave.task.name }</td>
					<td>${leave.task.processInstanceId }</td>
					<td>${leave.task.processDefinitionId }</td>
					<td>${leave.task.createTime }</td>
					<td>
						<c:if test="${empty leave.task.assignee }">
							<a class="btn" href="claim/${leave.task.id}"><i class="icon-eye-open"></i>签收</a>
						</c:if>
						<c:if test="${not empty leave.task.assignee }">
							<a class="btn" href="view/${leave.task.id}"><i class="icon-user"></i>办理</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			-->
		</tbody>
	</table>
</body>
</html>