class ToDo {
  String id;
  String todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: "01", todoText: "Resume Submit", isDone: false),
      ToDo(id: "02", todoText: "Sleep", isDone: false),
      ToDo(id: "03", todoText: "Tic-Tac-Toe", isDone: true),
      ToDo(id: "04", todoText: "Web-Based Resume", isDone: true),
      ToDo(id: "05", todoText: "WhatsApp Clone", isDone: false),
      ToDo(id: "06", todoText: "Keep notes", isDone: false),
    ];
  }
}
