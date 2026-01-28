import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas1_11pplg2/Components/custom_button.dart';
import 'package:tugas1_11pplg2/Components/custom_color.dart';
import 'package:tugas1_11pplg2/Components/custom_input.dart';
import 'package:tugas1_11pplg2/Controllers/menu_makanan_controller.dart';
import 'package:tugas1_11pplg2/Models/menu_makanan_model.dart';

class CustomForm extends StatelessWidget {
  final bool isEdit;
  final String? id;
  final ItemMakanan? makanan;

  CustomForm({
    super.key,
    this.isEdit = false,
    this.id,
    this.makanan,
  });

  final namaController = TextEditingController();
  final hargaController = TextEditingController();
  final stokController = TextEditingController();
  final imageController = TextEditingController();

  final controller = Get.find<MenuMakananController>();

  @override
  Widget build(BuildContext context) {
    if (isEdit && makanan != null) {
      namaController.text = makanan!.namaMakanan;
      hargaController.text = makanan!.hargaMakanan.toString();
      stokController.text = makanan!.stok.toString();
      imageController.text = makanan!.imageAddress;
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isEdit ? 'Edit Menu' : 'Tambah Menu',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.textPrimary,
                ),
              ),

              const SizedBox(height: 20),

              CustomInput(
                label: 'Nama Makanan',
                hintText: 'Contoh: Nasi Goreng',
                controller: namaController,
                prefixIcon: Icons.restaurant,
              ),

              CustomInput(
                label: 'Harga',
                hintText: 'Contoh: 15000',
                controller: hargaController,
                isNumber: true,
                prefixIcon: Icons.attach_money,
              ),

              CustomInput(
                label: 'Stok',
                hintText: 'Contoh: 20',
                controller: stokController,
                isNumber: true,
                prefixIcon: Icons.inventory_2,
              ),

              CustomInput(
                label: 'URL Gambar',
                hintText: 'https://example.com/image.jpg',
                controller: imageController,
                prefixIcon: Icons.image,
              ),

              const SizedBox(height: 12),

              CustomButton(
                myText: isEdit ? 'Update Menu' : 'Simpan Menu',
                onPressed: () {
                  controller.handleSubmitForm(
                    isEdit: isEdit,
                    id: id,
                    nama: namaController.text,
                    hargaText: hargaController.text,
                    stokText: stokController.text,
                    imageUrl: imageController.text,
                  );
                },
                backgroundColor: CustomColor.primary,
                myTextColor: CustomColor.textWhite,
                width: double.infinity,
              ),

              const SizedBox(height: 10),

              CustomButton(
                myText: 'Batal',
                onPressed: () => Get.back(),
                backgroundColor: CustomColor.grey,
                myTextColor: CustomColor.textPrimary,
                isOutlined: true,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}