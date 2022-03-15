import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ItemView extends GetView {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.toNamed(Routes.DETAIL_EDUKASI),
      onTap: () {},
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 48, // Image radius
                backgroundImage: NetworkImage(
                    'https://www.startupdonut.co.uk/sites/default/files/styles/landing_pages_lists/public/Guy_watson_249x167.png?itok=e_ct04Rx'),
              ),
              title: const Text('Name Poktan'),
              subtitle: Text(
                'Secondary Text',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
