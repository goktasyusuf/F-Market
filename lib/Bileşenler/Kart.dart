import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String isim;
  final int adet;
  final double fiyat;


  CartItem(
      {@required this.id,
        @required this.isim,
        @required this.adet,
        @required this.fiyat});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void urunEkle(String pdtid, String isim, double fiyat) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
              (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
                  isim: existingCartItem.isim,
                  adet: existingCartItem.adet + 1,
                  fiyat: existingCartItem.fiyat));
    } else {
      _items.putIfAbsent(
          pdtid,
              () => CartItem(
                isim: isim,
            id: DateTime.now().toString(),
                adet: 1,
                fiyat: fiyat,
          ));
    }
    notifyListeners();
  }

  void urunSil(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void tekUrunSil(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].adet > 1) {
      _items.update(
          id,
              (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
                  isim: existingCartItem.isim,
                  adet: existingCartItem.adet - 1,
                  fiyat: existingCartItem.fiyat));
    }
    notifyListeners();
  }

  void temizle() {
    _items = {};
    notifyListeners();
  }
//-----------------------------------------------------------------FAVORİLER İÇİN----------------------------------------------------------------
}
class Cartt with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void urunEkle(String pdtid, String isim, double fiyat) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
              (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              isim: existingCartItem.isim,
              adet: existingCartItem.adet + 1,
              fiyat: existingCartItem.fiyat));
    } else {
      _items.putIfAbsent(
          pdtid,
              () => CartItem(
            isim: isim,
            id: DateTime.now().toString(),
            adet: 1,
            fiyat: fiyat,
          ));
    }
    notifyListeners();
  }

  void urunSil(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void tekUrunSil(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].adet > 1) {
      _items.update(
          id,
              (existingCartItem) => CartItem(
              id: DateTime.now().toString(),
              isim: existingCartItem.isim,
              adet: existingCartItem.adet - 1,
              fiyat: existingCartItem.fiyat));
    }
    notifyListeners();
  }

  void temizle() {
    _items = {};
    notifyListeners();
  }

}