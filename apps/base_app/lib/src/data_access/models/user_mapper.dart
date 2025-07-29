import 'package:flutter_base_app/src/data_access/models/dto_models/product_dto.dart';
import 'package:flutter_base_app/src/data_access/models/product.dart';
import 'package:flutter_base_app/src/data_access/models/user.dart';

import 'dto_models/user_dto.dart';

extension UserDTOMapper on UserDTO {
  User toDomain() {
    return User(id: id, userName: userName, password: password);
  }
}

extension UserDomainMapper on User {
  UserDTO toDto(String password) {
    return UserDTO(id: id, userName: userName, password: password);
  }
}

extension ProductListDTOMapper on ProductDto {
  Product toDomain() {
    return Product(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt,
      belongsToId: belongsToId,
    );
  }
}
