class Dog {
  String message;
  String status;

  Dog({required this.message, required this.status});

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(message: json['message'], status: json['status']);
  }
}
