class Task {
  Task({required this.label, this.isDone = false});

  final String label;
  bool isDone;

  void toggleDone() {
    isDone = !isDone;
  }
}
