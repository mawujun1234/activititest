<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,org.activiti.engine.task.*"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/common/global.jsp"%>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-base-styles.jsp" %>
	<title>待办任务列表--chapter6</title>

	<script src="<%=request.getContextPath() %>/js/common/jquery.js" type="text/javascript"></script>
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

	<table width="100%" class="table table-bordered table-hover table-condensed">
		<thead>
			<tr>
				<th>任务ID</th>
				<th>任务名称</th>
				<th>流程实例ID</th>
				<th>流程定义ID</th>
				<th>任务创建时间</th>
				<th>办理人</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<%
		List<Task> tasks =(List<Task>)request.getAttribute("tasks");
		for(Task task:tasks){
		%>
		<tr>
					<td><%=task.getId()%></td>
					<td><%=task.getName()%></td>
					<td><%=task.getProcessInstanceId()%></td>
					<td><%=task.getProcessDefinitionId()%></td>
					<td><%=task.getCreateTime()%></td>
					<td><%=task.getAssignee()%></td>
					<td>
					<% if(task.getAssignee()==null){
					%>
					<a class="btn" href="claim/<%=task.getId()%>"><i class="icon-eye-open"></i>签收</a>
					<%
					}else { %>
						<a class="btn" href="getform/<%=task.getId()%>"><i class="icon-user"></i>办理</a>
					<%} %>
		
					</td>
				</tr>
		<%
		}
		%>
		<!-- 
			<c:forEach items="${tasks }" var="task">
				<tr>
					<td>${task.id }</td>
					<td>${task.name }</td>
					<td>${task.processInstanceId }</td>
					<td>${task.processDefinitionId }</td>
					<td>${task.createTime }</td>
					<td>${task.assignee }</td>
					<td>
						<c:if test="${empty task.assignee }">
							<a class="btn" href="claim/${task.id}"><i class="icon-eye-open"></i>签收</a>
						</c:if>
						<c:if test="${not empty task.assignee }">
							<a class="btn" href="getform/${task.id}"><i class="icon-user"></i>办理</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			 -->
		</tbody>
	</table>
</body>
</html>