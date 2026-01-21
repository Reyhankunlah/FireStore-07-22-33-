import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas1_11pplg2/Controllers/menu_makanan_controller.dart';

class MenuListMakanan extends StatelessWidget {
  const MenuListMakanan({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuMakananController>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Warung Bu Madu',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                );
              }

              if (controller.errorMessage.value.isNotEmpty) {
                return _buildError(controller);
              }

              if (controller.makananList.isEmpty) {
                return _buildEmpty();
              }

              return RefreshIndicator(
                onRefresh: controller.refreshMakanan,
                color: Colors.orange,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.makananList.length,
                  itemBuilder: (context, index) {
                    final entry = controller.makananList[index];
                    final id = entry.key;
                    final item = entry.value;

                    return _buildCard(
                      controller,
                      id,
                      item.namaMakanan,
                      item.hargaMakanan,
                      item.formattedPrice,
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () => _showCreateDialog(controller),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Selamat Datang',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            'Bu Madu',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    MenuMakananController controller,
    String id,
    String nama,
    int harga,
    String hargaFormat,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text('🍽️', style: TextStyle(fontSize: 40)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hargaFormat,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: () {
                    _showUpdateDialog(controller, id, nama, harga);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.deleteMakanan(id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.restaurant_menu, color: Colors.grey, size: 60),
          SizedBox(height: 16),
          Text(
            'Belum ada menu',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildError(MenuMakananController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          const SizedBox(height: 16),
          Text(
            controller.errorMessage.value,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: controller.fetchMakanan,
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }

  void _showCreateDialog(MenuMakananController controller) {
    final namaC = TextEditingController();
    final hargaC = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: const Text('Tambah Makanan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: namaC,
              decoration: const InputDecoration(labelText: 'Nama Makanan'),
            ),
            TextField(
              controller: hargaC,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Harga'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              controller.createMakanan(
                namaC.text,
                int.parse(hargaC.text),
              );
              Get.back();
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog(
    MenuMakananController controller,
    String id,
    String nama,
    int harga,
  ) {
    final namaC = TextEditingController(text: nama);
    final hargaC = TextEditingController(text: harga.toString());

    Get.dialog(
      AlertDialog(
        title: const Text('Edit Makanan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: namaC,
              decoration: const InputDecoration(labelText: 'Nama Makanan'),
            ),
            TextField(
              controller: hargaC,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Harga'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: Get.back,
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              controller.updateMakanan(
                id,
                namaC.text,
                int.parse(hargaC.text),
              );
              Get.back();
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
