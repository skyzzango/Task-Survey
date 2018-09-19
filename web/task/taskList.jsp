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
	Task task = Task.getInstance();
	List<TaskDto> taskList = new ArrayList<>();
	if (session.getAttribute("taskList") != null) {
		taskList.addAll((List<TaskDto>) session.getAttribute("taskList"));
	}
	if (taskList.size() == 0) {
		taskList.addAll(task.createTasks());
	}
	System.out.println("taskList1" + taskList);
	if (taskList.size() < 3) {
//		Thread t1 = new Thread(() -> {
			taskList.addAll(task.createTasks());
//		});
//		t1.run();
	}
	session.setAttribute("taskList", taskList);
	System.out.println("taskList2" + session.getAttribute("taskList").toString());
%>
