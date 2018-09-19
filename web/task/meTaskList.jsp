<%@ page import="task.Task" %>
<%@ page import="task.MeTaskDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-19
  Time: 오후 10:28
  To change this template use File | Settings | File Templates.
--%>
<%
	System.out.println("meTaskList Run");
	Task task = Task.getInstance();
	List<MeTaskDto> meTaskList = new ArrayList<>();

	if (session.getAttribute("taskList") == null) { meTaskList.addAll(task.createTaskMe()); }
	meTaskList.addAll((List<MeTaskDto>) session.getAttribute("meTaskList"));
	if (meTaskList.size() < 4) { meTaskList.addAll(task.createTaskMe()); }

	System.out.println("meTaskList Size: " + meTaskList.size());
	System.out.print("meTaskList Item: ");
	for (MeTaskDto one : meTaskList) {
		System.out.print("[" + one.getTitle() + "] ");
	}
	System.out.println();
	System.out.println();

	session.setAttribute("meTaskList", meTaskList);
%>