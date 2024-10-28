import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/relative_controller.dart';

class ShajraScreen extends StatelessWidget {
  final RelativesController controller = Get.find<RelativesController>();

  ShajraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Family Tree (Shajra)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Family Tree of Deceased Person',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: controller.relatives.length,
                itemBuilder: (context, index) {
                  final relative = controller.relatives[index];
                  return _buildRelativeTile(relative);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRelativeTile(relative) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          ListTile(
            title: Text('${relative.relation}: ${relative.name}'),
            subtitle: Text(
              'Alive Status: ${relative.deathStatus}, Sons: ${relative.sons}, Daughters: ${relative.daughters}',
            ),
          ),
          if (relative.isMarried)
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Spouse: ${relative.spouseName ?? 'N/A'}',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          // Display children names if there are any
          if (relative.sons > 0 || relative.daughters > 0)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < relative.sons; i++)
                    Text(
                        'Son ${i + 1}: Name Here', // Update with actual son names
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  for (int i = 0; i < relative.daughters; i++)
                    Text(
                        'Daughter ${i + 1}: Name Here', // Update with actual daughter names
                        style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
