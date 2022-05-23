import 'package:flutter/material.dart';
import 'package:gapoktan_app/app/modules/produk/controllers/produk_controller.dart';
import 'package:gapoktan_app/app/utils/constant.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetailProdukView extends GetView<ProdukController> {
  final box = GetStorage();
  final _scrollController = TrackingScrollController();

  // Part Scrroll
  @override
  Widget build(BuildContext context) {
    final data = controller.findBySlug(Get.arguments);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: "data.slug!",
                        child: Center(
                          child: Image.network(
                            "https://tokoterserah.com/storage/produk/thumb/604045a76c15eBERAS%20FORTUNE%205%20KG.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp ${formatCurrency.format(data.price!)}',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child: Text(
                          data.name!,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Terjual 0",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  // color: Colors.green,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.0),
                                  ),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        "0.0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("(0)")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 5, child: Container())
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 9,
                        color: Color(0xffD1D1D1),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.account_circle_rounded,
                                size: 60,
                                color: Colors.black,
                              ),
                              title: const Text(
                                "Gapoktan",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Indramayu ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "4.2",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Rating dan Ulasan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 60,
                                  child: VerticalDivider(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    // Respond to button press
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        width: 2.0, color: Color(0xff16A085)),
                                  ),
                                  child: Text(
                                    '     Lihat Toko    ',
                                    style: TextStyle(
                                      color: Color(0xff16A085),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 9,
                        color: Color(0xffD1D1D1),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Text(
                          "Detail Product",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Column",
                                  style: TextStyle(
                                    color: Color(0xff919A92),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "Value",
                                  style: TextStyle(
                                    color: Color(0xff919A92),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xff919A92),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Column",
                                  style: TextStyle(
                                    color: Color(0xff919A92),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "Value",
                                  style: TextStyle(
                                    color: Color(0xff919A92),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xff919A92),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Column",
                                  style: TextStyle(
                                    color: Color(0xff919A92),
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  "Value",
                                  style: TextStyle(
                                    color: Color(0xff919A92),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xff919A92),
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: TextStyle(
                                color: Color(0xff919A92),
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 70,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // fuction widget
  // Input
  _buildInputSearch() {
    final sizeIcon = BoxConstraints(minWidth: 35, minHeight: 35);
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4.0),
      ),
    );
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 8),
        child: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(4),
              isDense: true,
              enabledBorder: border,
              focusedBorder: border,
              hintText: "Cari di TaniApp",
              hintStyle: TextStyle(fontSize: 14, color: Color(0xff919A92)),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff919A92),
              ),
              prefixIconConstraints: sizeIcon,
              suffixIconConstraints: sizeIcon,
              filled: true,
              fillColor: Color(0xffF0F3F8)),
        ),
      ),
    );
  }

  // Icon
  _buildIconButton({
    VoidCallback? onPressed,
    IconData? icon,
    int notification = 0,
  }) =>
      Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: Colors.black,
            iconSize: 24,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Color(0xff16A085),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    constraints: BoxConstraints(minWidth: 22, minHeight: 22),
                    child: Text(
                      "$notification",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      );
}
