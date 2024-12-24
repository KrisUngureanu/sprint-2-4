package kz.bitlab.models;

import java.util.ArrayList;

public class DBManager {
    private static ArrayList<Task> tasks = new ArrayList<>();
    private static Long id = 6L;


    static {
        tasks.add(new Task(1L, "Создать Веб-приложение на Java EE", "Какое-то приложение", "2024-10-15", true));
        tasks.add(new Task(2L, "Убраться дома и закупить продукты", "Какое-то приложение", "2023-11-14", true));
        tasks.add(new Task(3L, "Выполнить все домашние задания", "Какое-то приложение", "2025-12-17", false));
        tasks.add(new Task(4L, "Записаться на качку", "Какое-то приложение", "2024-12-15", false));
        tasks.add(new Task(5L, "Учить итальянский", "Какое-то приложение", "2026-02-17", false));
    }

    public static void addTask(Task task){
        tasks.add(task);
        task.setId(id);
        id++;
    } //этот метод добавляет новую задачу в список

    public static Task getTask(Long id){
        for (Task task: tasks){
            if (task.getId() == id){
                return task;
            }
        }
        return null;
    } // этот метод возвращает объект задачи по id

    public static ArrayList getAllTasks(){
        return tasks;
    } //этот метод возвращает список всех задач

    public static void deleteTask(Long id){
        Task task = getTask(id);
        if (task != null){
            tasks.remove(task);
        }
    } //этот метод удаляет задачу из списка по id

}
