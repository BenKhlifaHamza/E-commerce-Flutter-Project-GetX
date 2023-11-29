import '../../../../../core/class/crud.dart';
import '../../../../../linksapi.dart';
import '../../../datamodel/addressmodel.dart';

class AddressesRemote {
  Crud crud;
  AddressesRemote(this.crud);

  addAddressRemote(AddressModel address) async {
    var response = await crud.postData(LinksApi.addAddress, {
      "address_name": address.addressName,
      "address_user_id": address.addressUserId,
      "address_city": address.addressCity,
      "address_street": address.addressStreet,
      "address_lat": address.addressLat,
      "address_long": address.addressLong
    });
    return response.fold((l) => l, (r) => r);
  }

  getAddressesRemote(String userId) async {
    var response = await crud.postData(LinksApi.getAddresses, {
      "user_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddressRemote(String addressId) async {
    var response = await crud.postData(LinksApi.deleteAddress, {
      "address_id": addressId,
    });
    return response.fold((l) => l, (r) => r);
  }

  editAddressRemote(AddressModel address) async {
    var response = await crud.postData(LinksApi.editAddress, {
      "address_id": address.addressId,
      "address_name": address.addressName,
      "address_city": address.addressCity,
      "address_street": address.addressStreet,
      "address_lat": address.addressLat,
      "address_long": address.addressLong
    });
    return response.fold((l) => l, (r) => r);
  }
}
