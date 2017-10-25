<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,org.activiti.engine.repository.*,org.activiti.engine.form.*"%>
<%@ page import="org.activiti.engine.form.*, org.apache.commons.lang3.*" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/common/global.jsp"%>
	<%@ include file="/common/meta.jsp" %>
	<%@ include file="/common/include-base-styles.jsp" %>
	<title>启动流程</title>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
	$(function() {
		$('.datepicker').datepicker();
	});
	</script>
</head>
<body>
<h3>启动流程—
<%
String processDefinitionId=(String)request.getAttribute("processDefinitionId");
ProcessDefinition processDefinition=(ProcessDefinition)request.getAttribute("processDefinition");
Boolean hasStartFormKey=(Boolean)request.getAttribute("hasStartFormKey");
if(hasStartFormKey){
%>
	[<%=processDefinition.getName()%>]，版本号：<%=processDefinition.getVersion()%>
<% 	
} else {
	StartFormData startFormData=(StartFormData)request.getAttribute("startFormData");
%>	
	[<%=startFormData.getProcessDefinition().getName() %>]，版本号：<%=startFormData.getProcessDefinition().getVersion() %>
<% 
}
%>
</h3>

	<hr/>
	<form action="<%=request.getContextPath() %>/chapter6/process-instance/start/<%=processDefinitionId %>" class="form-horizontal" method="post">
		<%
		if(hasStartFormKey){
			Object startFormData=request.getAttribute("startFormData");
		%>
		<%=startFormData %>	
		<%
		}
		%>
		<%
		if(!hasStartFormKey){
			StartFormData startFormData=(StartFormData)request.getAttribute("startFormData");
			List<FormProperty>  formProperties=startFormData.getFormProperties();
			for(FormProperty fp:formProperties){
				FormType type =fp.getType();
				String[] keys = {"datePattern"};
				for (String key: keys) {
					pageContext.setAttribute(key, ObjectUtils.toString(type.getInformation(key)));
				}
		%>
				<div class="control-group">
				<%-- 文本或者数字类型 --%>
		<%
				if("string".equals(type.getName()) || "long".equals(type.getName())){
		%>
				<label class="control-label" for="<%=fp.getId() %>"><%=fp.getName() %>:</label>
				<div class="controls">
					<input type="text" id="<%=fp.getId() %>" name="<%=fp.getId() %>" data-type="<%=type.getName() %>" value="" />
				</div>
		<%			
				}
		%>
		
				


				<%-- 日期 --%>
		<%
				if("date".equals(type.getName())){
		%>
				<label class="control-label" for="<%=fp.getId() %>"><%=fp.getName() %>:</label>
				<div class="controls">
					<input type="text" id="<%=fp.getId() %>" name="<%=fp.getId() %>" class="datepicker"  data-type="<%=type.getName() %>" data-date-format="<%=((String)pageContext.getAttribute("datePattern")).toLowerCase() %>"  />
				</div>
		<%			
				}
		%>


				<%-- Javascript --%>
		<%
				if("javascript".equals(type.getName())){
		%>
				<script type="text/javascript"><%=fp.getValue()%>;</script>
		<%			
				}
		%>
				</div>
		<%	
			}
		%>
		
		<%
		}
		%>
<!-- 
		<c:if test="${!hasStartFormKey}">
			<c:forEach items="${startFormData.formProperties}" var="fp">
				<c:set var="fpo" value="${fp}"/>
				<%--
					// 把需要获取的属性读取并设置到pageContext域
					FormType type = ((FormProperty)pageContext.getAttribute("fpo")).getType();
					String[] keys = {"datePattern"};
					for (String key: keys) {
						pageContext.setAttribute(key, ObjectUtils.toString(type.getInformation(key)));
					}
				--%>
				<div class="control-group">
				<%-- 文本或者数字类型 --%>
				<c:if test="${fp.type.name == 'string' || fp.type.name == 'long'}">
					<label class="control-label" for="${fp.id}">${fp.name}:</label>
					<div class="controls">
						<input type="text" id="${fp.id}" name="${fp.id}" data-type="${fp.type.name}" value="" />
					</div>
				</c:if>

				<%-- 日期 --%>
				<c:if test="${fp.type.name == 'date'}">
					<label class="control-label" for="${fp.id}">${fp.name}:</label>
					<div class="controls">
						<input type="text" id="${fp.id}" name="${fp.id}" class="datepicker"  data-type="${fp.type.name}" data-date-format="${fn:toLowerCase(datePattern)}" />
					</div>
				</c:if>

				<%-- Javascript --%>
				<c:if test="${fp.type.name == 'javascript'}">
					<script type="text/javascript">${fp.value};</script>
				</c:if>
				</div>
			</c:forEach>
		</c:if>
 -->
		<%-- 按钮区域 --%>
		<div class="control-group">
			<div class="controls">
				<a href="javascript:history.back();" class="btn"><i class="icon-backward"></i>返回列表</a>
				<button type="submit" class="btn"><i class="icon-play"></i>启动流程</button>
			</div>
		</div>
	</form>
</body>
</html>