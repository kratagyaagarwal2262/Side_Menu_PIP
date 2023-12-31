class Dashboard {
  String? screenType;
  List<Screens>? screens;

  Dashboard({this.screenType, this.screens});

  Dashboard.fromJson(Map<String, dynamic> json) {
    screenType = json['screenType'];
    if (json['screens'] != null) {
      screens = <Screens>[];
      json['screens'].forEach((v) {
        screens!.add(Screens.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['screenType'] = screenType;
    if (screens != null) {
      data['screens'] = screens!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Screens {
  String? menuType;
  List<MenuItems>? menuItems;

  Screens({this.menuType, this.menuItems});

  Screens.fromJson(Map<String, dynamic> json) {
    menuType = json['menuType'];
    if (json['menuItems'] != null) {
      menuItems = <MenuItems>[];
      json['menuItems'].forEach((v) {
        menuItems!.add(MenuItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['menuType'] = menuType;
    if (menuItems != null) {
      data['menuItems'] = menuItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuItems {
  String? name;
  String? icon;
  int? count;
  String? email;
  String? profileImageUrl;
  String? frontIcon;
  String? orderStatus;
  String? id;
  String? city;
  int? age;
  int? hoursAgo;
  String? meetingDate;

  MenuItems(
      {this.name,
      this.icon,
      this.count,
      this.email,
      this.profileImageUrl,
      this.frontIcon,
      this.orderStatus,
      this.id,
      this.city,
      this.age,
      this.hoursAgo,
      this.meetingDate});

  MenuItems.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    count = json['count'];
    email = json['email'];
    profileImageUrl = json['profileImageUrl'];
    frontIcon = json['frontIcon'];
    orderStatus = json['orderStatus'];
    id = json['id'];
    city = json['city'];
    age = json['age'];
    hoursAgo = json['hoursAgo'];
    meetingDate = json['meetingDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['count'] = count;
    data['email'] = email;
    data['profileImageUrl'] = profileImageUrl;
    data['frontIcon'] = frontIcon;
    data['orderStatus'] = orderStatus;
    data['id'] = id;
    data['city'] = city;
    data['age'] = age;
    data['hoursAgo'] = hoursAgo;
    data['meetingDate'] = meetingDate;
    return data;
  }
}
