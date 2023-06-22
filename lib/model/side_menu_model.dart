class SideMenuModel {
  String? menuType;
  List<MenuItems>? menuItems;

  SideMenuModel({this.menuType, this.menuItems});

  SideMenuModel.fromJson(Map<String, dynamic> json) {
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
  String? menu;
  String? icon;
  String? color;
  String? backgroundColor;

  MenuItems({this.menu, this.icon, this.color, this.backgroundColor});

  MenuItems.fromJson(Map<String, dynamic> json) {
    menu = json['menu'];
    icon = json['icon'];
    color = json['color'];
    backgroundColor = json['backgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['menu'] = menu;
    data['icon'] = icon;
    data['color'] = color;
    data['backgroundColor'] = backgroundColor;
    return data;
  }
}
