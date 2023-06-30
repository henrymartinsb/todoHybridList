import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/repositories/todo_repository.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedTodoPos;

  String? errorText;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Adicione uma tarefa',
                            hintText: 'Ex. Estudar inglês as 19h',
                            errorText: errorText,
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurpleAccent,
                                width: 2,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          String text = todoController.text;

                          if (text.isEmpty) {
                            setState(() {
                              errorText = 'Insira algum texto.';
                            });
                            return;
                          }

                          setState(() {
                            Todo newTodo =
                                Todo(title: text, dateTime: DateTime.now());
                            todos.add(newTodo);
                            errorText = null;
                          });
                          todoController.clear();
                          todoRepository.saveTodoList(todos);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.all(14)),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (Todo todo in todos)
                          TodoListItem(
                            todo: todo,
                            onDelete: onDelete,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                            'Você possui ${todos.length} tarefas pendentes'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: showDeleteTodosConfirmationDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                        child: const Text('Excluir tudo'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${todo.title} foi removido com sucesso!',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.1,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
            todoRepository.saveTodoList(todos);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deseja excluir tudo?'),
        content: const Text(
            'Ao clicar em "Excluir" você excluirá todas as tarefas da lista, você tem certeza disso?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style:
                TextButton.styleFrom(foregroundColor: Colors.deepPurpleAccent),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
    todoRepository.saveTodoList(todos);
  }
}
