<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.models.Task" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Task Manager</title>
    <meta charset="UTF-8">
    <%@include file="vendor/header.jsp"%>
</head>
<body>
<div class="container">
    <%@include file="vendor/navbar.jsp"%>
    <br>
    <!-- Button trigger modal -->
    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="background-color: #1f1a62; color: #c5e8ef">
        + Добавить задание
    </button>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Новое задание</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/addTask" method="post" class="form-control">
                    <div class="modal-body">
                        <div class="container">

                                <label>Наименование</label>
                                <input type="text" class="form-control" placeholder="Наименование" name="nameTask">
                                <label>Описание</label>
                                <textarea name="descTask"  cols="30" rows="10" class="form-control" placeholder="Описание"></textarea>
                                <label>Крайний срок</label>
                                <input type="date" name="deadlime" class="form-control">

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col" style="width: 5%;">ID</th>
            <th scope="col" style="width: 40%;">Наименование</th> <!-- Увеличиваем ширину -->
            <th scope="col" style="width: 15%;">Крайний срок</th>
            <th scope="col" style="width: 15%;">Выполнено</th>
            <th scope="col" style="width: 25%;">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasks");
            if (tasks != null){
                for (Task task: tasks){

        %>
        <tr>
            <th scope="row"><%=task.getId()%></th>
            <td><%=task.getName()%></td>
            <td><%=task.getDeadlineDate()%></td>
            <%if (task.isCompleted()){%>
                <td>Да</td>
            <%}else{%>
                <td>Нет</td>
            <%}%>
            <td><a href="/details?idTask=<%=task.getId()%>" class="btn text-white bg-black">Детали</a></td>
        </tr>
<%}}%>
        </tbody>
    </table>
</div>


</body>
</html>
