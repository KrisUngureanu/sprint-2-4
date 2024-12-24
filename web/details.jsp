<%@ page import="kz.bitlab.models.Task" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Details</title>
    <meta charset="UTF-8">
    <%@include file="vendor/header.jsp"%>
    <style>
        .form-container {
            max-width: 600px; /* Ограничиваем ширину формы */
            margin: 0 auto; /* Центрируем форму */
            background-color: #f8f9fa; /* Светлый фон */
            padding: 20px; /* Внутренние отступы */
            border-radius: 10px; /* Закругленные края */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Тень */
        }

        .form-container label {
            font-weight: bold; /* Жирный шрифт для меток */
            margin-top: 10px; /* Отступ сверху */
        }

        .form-container textarea, .form-container input, .form-container select {
            margin-bottom: 15px; /* Отступ между элементами */
        }

        .btn-save {
            background-color: #28a745; /* Зеленая кнопка */
            color: white;
            border: none;
        }

        .btn-delete {
            background-color: #dc3545; /* Красная кнопка */
            color: white;
            border: none;
        }

        .btn-save:hover, .btn-delete:hover {
            opacity: 0.9; /* Легкое затемнение при наведении */
        }
    </style>
</head>
<body>
<div class="container">
    <%@include file="vendor/navbar.jsp"%>
    <div class="form-container">
        <form action="/updateTask" method="POST">
            <label for="name">Наименование:</label>
            <%
                Task task = (Task) request.getAttribute("task");
            %>

            <input type="text" id="name" name="name" class="form-control" placeholder="Наименование" value="<%=task.getName()%>" required>
            <input type="hidden" name="id" value="<%=task.getId()%>">
            <label for="description">Описание:</label>
            <textarea id="description" name="description" rows="5" class="form-control" placeholder="Описание" required><%=task.getDescription()%></textarea>

            <label for="deadline">Крайний срок:</label>
            <input type="date" id="deadline" name="deadline" class="form-control" value="<%=task.getDeadlineDate()%>" required>

            <label for="completed">Выполнено:</label>
            <select id="completed" name="completed" class="form-control">
                <option value="true" <%= task.isCompleted() ? "selected" : "" %>>Да</option>
                <option value="false" <%= !task.isCompleted() ? "selected" : "" %>>Нет</option>
            </select>

            <div class="d-flex justify-content-between mt-4">
                <button type="submit" class="btn btn-save">Сохранить</button>
            </div>
        </form>
        <form action="/deleteTask" method="POST" class="d-inline">
            <input type="hidden" name="id" value="<%=task.getId()%>">
            <button type="submit" class="btn btn-delete">Удалить</button>
        </form>
    </div>
</div>
</body>
</html>
