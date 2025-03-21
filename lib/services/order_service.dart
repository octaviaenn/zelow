import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Tambah item ke cart
  Future<void> addToCart(Map<String, dynamic> itemData) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore
            .collection('user')
            .doc(user.uid)
            .collection('cart')
            .add(itemData);
      }
    } catch (e) {
      print('Gagal menambahkan ke cart: $e');
    }
  }

  // Get list cart
  Stream<QuerySnapshot> getCartItems() {
    final user = _auth.currentUser;
    return _firestore
        .collection('user')
        .doc(user!.uid)
        .collection('cart')
        .snapshots();
  }

  // Hapus item di cart
  Future<void> removeFromCart(String cartItemId) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore
            .collection('user')
            .doc(user.uid)
            .collection('cart')
            .doc(cartItemId)
            .delete();
      }
    } catch (e) {
      print('Gagal menghapus item dari cart: $e');
    }
  }

  // Checkout Cart -> simpan ke pesanan (status: Sedang Berlangsung)
  Future<void> checkout(Function(String) onError) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final cartRef = _firestore.collection('user').doc(user.uid).collection('cart');
        final cartItems = await cartRef.get();

        if (cartItems.docs.isEmpty) {
          onError('Keranjang kosong!');
          return;
        }

        for (var item in cartItems.docs) {
          Map<String, dynamic> itemData = item.data();
          itemData['status'] = 'Sedang Berlangsung';
          itemData['tanggalPesanan'] = Timestamp.now();

          // Tambahkan ke pesanan
          await _firestore
              .collection('user')
              .doc(user.uid)
              .collection('pesanan')
              .add(itemData);

          // Hapus dari cart
          await cartRef.doc(item.id).delete();
        }
      }
    } catch (e) {
      onError('Gagal checkout: $e');
    }
  }

  // Get pesanan by status (Sedang Berlangsung, Selesai, Dibatalkan)
  Stream<QuerySnapshot> getPesananByStatus(String status) {
    final user = _auth.currentUser;
    return _firestore
        .collection('user')
        .doc(user!.uid)
        .collection('pesanan')
        .where('status', isEqualTo: status)
        .snapshots();
  }

  // Update status pesanan
  Future<void> updateStatusPesanan(String pesananId, String newStatus) async {
    try {
      final user = _auth.currentUser;
      await _firestore
          .collection('user')
          .doc(user!.uid)
          .collection('pesanan')
          .doc(pesananId)
          .update({'status': newStatus});
    } catch (e) {
      print('Gagal update status pesanan: $e');
    }
  }

  // Dapatkan detail pesanan
  Future<DocumentSnapshot> getPesananDetail(String pesananId) async {
    final user = _auth.currentUser;
    return await _firestore
        .collection('user')
        .doc(user!.uid)
        .collection('pesanan')
        .doc(pesananId)
        .get();
  }
}
