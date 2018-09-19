<%@ page import="task.TaskDto" %>
<%@ page import="java.util.List" %>
<%@ page import="task.Task" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-19
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	System.out.println("addTaskList Run");
	Task task = Task.getInstance();
	List<TaskDto> taskList = ((List<TaskDto>) session.getAttribute("taskList"));
	if (taskList.size() < 5) {
		taskList.addAll(task.createTaskIt());
	}
	System.out.println("addTaskList Show: " + taskList);
	session.setAttribute("taskList", taskList);
%>
