import 'address_component.dart';
import 'geometry.dart';

class PlaceDetails {
  List<AddressComponent>? addressComponents;
  String? adrAddress;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  String? placeId;
  String? reference;
  List<String>? types;
  String? url;
  int? utcOffset;
  String? vicinity;

  PlaceDetails({
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name,
    this.placeId,
    this.reference,
    this.types,
    this.url,
    this.utcOffset,
    this.vicinity,
  });

  factory PlaceDetails.fromJson(Map<String, dynamic> json) => PlaceDetails(
        addressComponents: (json['address_components'] as List<dynamic>?)
            ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
            .toList(),
        adrAddress: json['adr_address'] as String?,
        formattedAddress: json['formatted_address'] as String?,
        geometry: json['geometry'] == null
            ? null
            : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
        icon: json['icon'] as String?,
        iconBackgroundColor: json['icon_background_color'] as String?,
        iconMaskBaseUri: json['icon_mask_base_uri'] as String?,
        name: json['name'] as String?,
        placeId: json['place_id'] as String?,
        reference: json['reference'] as String?,
        types: (json['types'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList(),
        url: json['url'] as String?,
        utcOffset: json['utc_offset'] as int?,
        vicinity: json['vicinity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'address_components':
            addressComponents?.map((e) => e.toJson()).toList(),
        'adr_address': adrAddress,
        'formatted_address': formattedAddress,
        'geometry': geometry?.toJson(),
        'icon': icon,
        'icon_background_color': iconBackgroundColor,
        'icon_mask_base_uri': iconMaskBaseUri,
        'name': name,
        'place_id': placeId,
        'reference': reference,
        'types': types,
        'url': url,
        'utc_offset': utcOffset,
        'vicinity': vicinity,
      };
}
