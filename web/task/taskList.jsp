<%@ page import="task.Task" %>
<%@ page import="task.TaskDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-19
  Time: 오전 3:05
  To change this template use File | Settings | File Templates.
--%>
<%
	System.out.println("TaskList Run");
	Task task = Task.getInstance();
	List<TaskDto> taskList = new ArrayList<>();

	if (session.getAttribute("taskList") == null) { taskList.addAll(task.createTaskIt()); }
	taskList.addAll((List<TaskDto>) session.getAttribute("taskList"));
	if (taskList.size() < 4) { taskList.addAll(task.createTaskIt()); }

	System.out.println("TaskList Size: " + taskList.size());
	System.out.print("TaskList Item: ");
	for (TaskDto one : taskList) {
		System.out.print("[" + one.getTitle() + "] ");
	}
	System.out.println();
	System.out.println();

	session.setAttribute("taskList", taskList);
%>
