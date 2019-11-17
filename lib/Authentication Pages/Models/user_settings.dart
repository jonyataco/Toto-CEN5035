/// Class that determines the settings for each User
class UserSettings {
  final int userID;
  final bool notifications;
  final bool darkMode;

  /// Default constructor
  UserSettings(this.userID, this.notifications, this.darkMode);

  /// Named constructor that makes a UserSettings object from json
  UserSettings.fromJson(Map<String, dynamic> json)
    : userID = json['userID'],
      notifications = json['notifications'],
      darkMode = json['darkMode'];

  Map<String, dynamic> toJson() =>
    {
      'userID' : userID,
      'notifications' : notifications,
      'darkMode' : darkMode
    };

}