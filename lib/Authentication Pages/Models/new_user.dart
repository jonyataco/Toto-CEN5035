class NewUser {
  final String firstName;
  final String lastName;
  final String petName;
  final String email;

  /// Default constructor for NewUser
  NewUser(this.firstName, this.lastName, this.petName, this.email);

  /// Named constructor that takes in a json object. The json object 
  /// will probably be called when a query is made from the database
  NewUser.fromJson(Map<String, dynamic> json)
    : firstName = json['firstName'],
      lastName = json['lastName'],
      petName = json['petName'],
      email = json['email'];

  /// Method that returns a NewUser and its corresponding fields into a JSON
  /// object. NOTE: The method uses an arrow function that is very similar to 
  /// ES6 arrow functions. The arrow function returns whatever statement
  /// is executed.
  Map<String, dynamic> toJson() => 
    {
      'firstName' : firstName,
      'lastName' : lastName,
      'petName' : petName,
      'email' : email
    };
}