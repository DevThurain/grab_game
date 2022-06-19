// To parse required this JSON data, do
//
//     final epicGameData = epicGameDataFromJson(jsonString);

import 'dart:convert';

EpicGameData epicGameDataFromJson(String str) => EpicGameData.fromJson(json.decode(str));

String epicGameDataToJson(EpicGameData data) => json.encode(data.toJson());

class EpicGameData {
    EpicGameData({
        required this.data,
    });

    Data data;

    factory EpicGameData.fromJson(Map<String, dynamic> json) => EpicGameData(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.catalog,
    });

    Catalog catalog;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        catalog: Catalog.fromJson(json["Catalog"]),
    );

    Map<String, dynamic> toJson() => {
        "Catalog": catalog.toJson(),
    };
}

class Catalog {
    Catalog({
        required this.searchStore,
    });

    SearchStore searchStore;

    factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
        searchStore: SearchStore.fromJson(json["searchStore"]),
    );

    Map<String, dynamic> toJson() => {
        "searchStore": searchStore.toJson(),
    };
}

class SearchStore {
    SearchStore({
        required this.elements,
        required this.paging,
    });

    List<Element> elements;
    Paging paging;

    factory SearchStore.fromJson(Map<String, dynamic> json) => SearchStore(
        elements: List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
    );

    Map<String, dynamic> toJson() => {
        "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
        "paging": paging.toJson(),
    };
}

class Element {
    Element({
        required this.title,
        required this.id,
        required this.namespace,
        required this.description,
        required this.effectiveDate,
        required this.offerType,
        required this.expiryDate,
        required this.status,
        required this.isCodeRedemptionOnly,
        required this.keyImages,
        required this.seller,
        required this.productSlug,
        required this.urlSlug,
        required this.url,
        required this.items,
        required this.customAttributes,
        required this.categories,
        required this.tags,
        required this.catalogNs,
        required this.offerMappings,
        required this.price,
        required this.promotions,
    });

    String title;
    String id;
    String namespace;
    String description;
    DateTime effectiveDate;
    String offerType;
    dynamic expiryDate;
    String status;
    bool isCodeRedemptionOnly;
    List<KeyImage> keyImages;
    Seller seller;
    String productSlug;
    String urlSlug;
    dynamic url;
    List<Item> items;
    List<CustomAttribute> customAttributes;
    List<Category> categories;
    List<Tag> tags;
    CatalogNs catalogNs;
    List<Mapping> offerMappings;
    Price price;
    Promotions? promotions;

    factory Element.fromJson(Map<String, dynamic> json) => Element(
        title: json["title"],
        id: json["id"],
        namespace: json["namespace"],
        description: json["description"],
        effectiveDate: DateTime.parse(json["effectiveDate"]),
        offerType: json["offerType"],
        expiryDate: json["expiryDate"],
        status: json["status"],
        isCodeRedemptionOnly: json["isCodeRedemptionOnly"],
        keyImages: List<KeyImage>.from(json["keyImages"].map((x) => KeyImage.fromJson(x))),
        seller: Seller.fromJson(json["seller"]),
        productSlug: json["productSlug"] == null ? null : json["productSlug"],
        urlSlug: json["urlSlug"],
        url: json["url"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        customAttributes: List<CustomAttribute>.from(json["customAttributes"].map((x) => CustomAttribute.fromJson(x))),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        catalogNs: CatalogNs.fromJson(json["catalogNs"]),
        offerMappings: List<Mapping>.from(json["offerMappings"].map((x) => Mapping.fromJson(x))),
        price: Price.fromJson(json["price"]),
        promotions: json["promotions"] == null ? null : Promotions.fromJson(json["promotions"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
        "namespace": namespace,
        "description": description,
        "effectiveDate": effectiveDate.toIso8601String(),
        "offerType": offerType,
        "expiryDate": expiryDate,
        "status": status,
        "isCodeRedemptionOnly": isCodeRedemptionOnly,
        "keyImages": List<dynamic>.from(keyImages.map((x) => x.toJson())),
        "seller": seller.toJson(),
        "productSlug": productSlug == null ? null : productSlug,
        "urlSlug": urlSlug,
        "url": url,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "customAttributes": List<dynamic>.from(customAttributes.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "catalogNs": catalogNs.toJson(),
        "offerMappings": List<dynamic>.from(offerMappings.map((x) => x.toJson())),
        "price": price.toJson(),
        "promotions": promotions == null ? null : promotions!.toJson(),
    };
}

class CatalogNs {
    CatalogNs({
        required this.mappings,
    });

    List<Mapping> mappings;

    factory CatalogNs.fromJson(Map<String, dynamic> json) => CatalogNs(
        mappings: List<Mapping>.from(json["mappings"].map((x) => Mapping.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mappings": List<dynamic>.from(mappings.map((x) => x.toJson())),
    };
}

class Mapping {
    Mapping({
        required this.pageSlug,
        required this.pageType,
    });

    String pageSlug;
    String pageType;

    factory Mapping.fromJson(Map<String, dynamic> json) => Mapping(
        pageSlug: json["pageSlug"],
        pageType: json["pageType"],
    );

    Map<String, dynamic> toJson() => {
        "pageSlug": pageSlug,
        "pageType": pageType,
    };
}

class Category {
    Category({
        required this.path,
    });

    String path;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        path: json["path"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
    };
}

class CustomAttribute {
    CustomAttribute({
        required this.key,
        required this.value,
    });

    String key;
    String value;

    factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
    };
}

class Item {
    Item({
        required this.id,
        required this.namespace,
    });

    String id;
    String namespace;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        namespace: json["namespace"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "namespace": namespace,
    };
}

class KeyImage {
    KeyImage({
        required this.type,
        required this.url,
    });

    String type;
    String url;

    factory KeyImage.fromJson(Map<String, dynamic> json) => KeyImage(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}

class Price {
    Price({
        required this.totalPrice,
        required this.lineOffers,
    });

    TotalPrice totalPrice;
    List<LineOffer> lineOffers;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        totalPrice: TotalPrice.fromJson(json["totalPrice"]),
        lineOffers: List<LineOffer>.from(json["lineOffers"].map((x) => LineOffer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice.toJson(),
        "lineOffers": List<dynamic>.from(lineOffers.map((x) => x.toJson())),
    };
}

class LineOffer {
    LineOffer({
        required this.appliedRules,
    });

    List<AppliedRule> appliedRules;

    factory LineOffer.fromJson(Map<String, dynamic> json) => LineOffer(
        appliedRules: List<AppliedRule>.from(json["appliedRules"].map((x) => AppliedRule.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "appliedRules": List<dynamic>.from(appliedRules.map((x) => x.toJson())),
    };
}

class AppliedRule {
    AppliedRule({
        required this.id,
        required this.endDate,
        required this.discountSetting,
    });

    String id;
    DateTime endDate;
    AppliedRuleDiscountSetting discountSetting;

    factory AppliedRule.fromJson(Map<String, dynamic> json) => AppliedRule(
        id: json["id"],
        endDate: DateTime.parse(json["endDate"]),
        discountSetting: AppliedRuleDiscountSetting.fromJson(json["discountSetting"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "endDate": endDate.toIso8601String(),
        "discountSetting": discountSetting.toJson(),
    };
}

class AppliedRuleDiscountSetting {
    AppliedRuleDiscountSetting({
        required this.discountType,
    });

    String discountType;

    factory AppliedRuleDiscountSetting.fromJson(Map<String, dynamic> json) => AppliedRuleDiscountSetting(
        discountType: json["discountType"],
    );

    Map<String, dynamic> toJson() => {
        "discountType": discountType,
    };
}

class TotalPrice {
    TotalPrice({
        required this.discountPrice,
        required this.originalPrice,
        required this.voucherDiscount,
        required this.discount,
        required this.currencyCode,
        required this.currencyInfo,
        required this.fmtPrice,
    });

    int discountPrice;
    int originalPrice;
    int voucherDiscount;
    int discount;
    String currencyCode;
    CurrencyInfo currencyInfo;
    FmtPrice fmtPrice;

    factory TotalPrice.fromJson(Map<String, dynamic> json) => TotalPrice(
        discountPrice: json["discountPrice"],
        originalPrice: json["originalPrice"],
        voucherDiscount: json["voucherDiscount"],
        discount: json["discount"],
        currencyCode: json["currencyCode"],
        currencyInfo: CurrencyInfo.fromJson(json["currencyInfo"]),
        fmtPrice: FmtPrice.fromJson(json["fmtPrice"]),
    );

    Map<String, dynamic> toJson() => {
        "discountPrice": discountPrice,
        "originalPrice": originalPrice,
        "voucherDiscount": voucherDiscount,
        "discount": discount,
        "currencyCode": currencyCode,
        "currencyInfo": currencyInfo.toJson(),
        "fmtPrice": fmtPrice.toJson(),
    };
}

class CurrencyInfo {
    CurrencyInfo({
        required this.decimals,
    });

    int decimals;

    factory CurrencyInfo.fromJson(Map<String, dynamic> json) => CurrencyInfo(
        decimals: json["decimals"],
    );

    Map<String, dynamic> toJson() => {
        "decimals": decimals,
    };
}

class FmtPrice {
    FmtPrice({
        required this.originalPrice,
        required this.discountPrice,
        required this.intermediatePrice,
    });

    String originalPrice;
    String discountPrice;
    String intermediatePrice;

    factory FmtPrice.fromJson(Map<String, dynamic> json) => FmtPrice(
        originalPrice: json["originalPrice"],
        discountPrice: json["discountPrice"],
        intermediatePrice: json["intermediatePrice"],
    );

    Map<String, dynamic> toJson() => {
        "originalPrice": originalPrice,
        "discountPrice": discountPrice,
        "intermediatePrice": intermediatePrice,
    };
}

class Promotions {
    Promotions({
        required this.promotionalOffers,
        required this.upcomingPromotionalOffers,
    });

    List<PromotionalOffer> promotionalOffers;
    List<PromotionalOffer> upcomingPromotionalOffers;

    factory Promotions.fromJson(Map<String, dynamic> json) => Promotions(
        promotionalOffers: List<PromotionalOffer>.from(json["promotionalOffers"].map((x) => PromotionalOffer.fromJson(x))),
        upcomingPromotionalOffers: List<PromotionalOffer>.from(json["upcomingPromotionalOffers"].map((x) => PromotionalOffer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "promotionalOffers": List<dynamic>.from(promotionalOffers.map((x) => x.toJson())),
        "upcomingPromotionalOffers": List<dynamic>.from(upcomingPromotionalOffers.map((x) => x.toJson())),
    };
}

class PromotionalOffer {
    PromotionalOffer({
        required this.promotionalOffers,
    });

    List<PromotionalOfferPromotionalOffer> promotionalOffers;

    factory PromotionalOffer.fromJson(Map<String, dynamic> json) => PromotionalOffer(
        promotionalOffers: List<PromotionalOfferPromotionalOffer>.from(json["promotionalOffers"].map((x) => PromotionalOfferPromotionalOffer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "promotionalOffers": List<dynamic>.from(promotionalOffers.map((x) => x.toJson())),
    };
}

class PromotionalOfferPromotionalOffer {
    PromotionalOfferPromotionalOffer({
        required this.startDate,
        required this.endDate,
        required this.discountSetting,
    });

    DateTime startDate;
    DateTime endDate;
    PromotionalOfferDiscountSetting discountSetting;

    factory PromotionalOfferPromotionalOffer.fromJson(Map<String, dynamic> json) => PromotionalOfferPromotionalOffer(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        discountSetting: PromotionalOfferDiscountSetting.fromJson(json["discountSetting"]),
    );

    Map<String, dynamic> toJson() => {
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "discountSetting": discountSetting.toJson(),
    };
}

class PromotionalOfferDiscountSetting {
    PromotionalOfferDiscountSetting({
        required this.discountType,
        required this.discountPercentage,
    });

    String discountType;
    int discountPercentage;

    factory PromotionalOfferDiscountSetting.fromJson(Map<String, dynamic> json) => PromotionalOfferDiscountSetting(
        discountType: json["discountType"],
        discountPercentage: json["discountPercentage"],
    );

    Map<String, dynamic> toJson() => {
        "discountType": discountType,
        "discountPercentage": discountPercentage,
    };
}

class Seller {
    Seller({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Tag {
    Tag({
        required this.id,
    });

    String id;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}

class Paging {
    Paging({
        required this.count,
        required this.total,
    });

    int count;
    int total;

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        count: json["count"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "total": total,
    };
}
