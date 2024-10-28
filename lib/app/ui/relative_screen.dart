import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shajra_app/app/controllers/relative_controller.dart';
import '../controllers/inheritence_controller.dart';

class RelativeScreen extends StatelessWidget {
  // final InheritanceController controller = Get.put(InheritanceController());
  final RelativesController relativesController =
      Get.put(RelativesController());

  RelativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Relatives' Details"),
      ),
      body: GetBuilder<InheritanceController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              // Parent Alive Status
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: const Text(
                      "Parent Alive Status",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              labelText: 'Father Alive Status'),
                          items: [
                            'Alive',
                            'Died Before',
                            'Died After',
                          ].map((status) {
                            return DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.fatherAliveStatus.value = value ?? '';
                          },
                          value: controller.fatherAliveStatus.value.isEmpty
                              ? null
                              : controller.fatherAliveStatus.value,
                          validator: (value) =>
                              value == null ? 'Please select a status' : null,
                        ),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              labelText: 'Mother Alive Status'),
                          items: [
                            'Alive',
                            'Died Before',
                            'Died After',
                          ].map((status) {
                            return DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.motherAliveStatus.value = value ?? '';
                          },
                          value: controller.motherAliveStatus.value.isEmpty
                              ? null
                              : controller.motherAliveStatus.value,
                          validator: (value) =>
                              value == null ? 'Please select a status' : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Relative Details
              ...controller.relatives.map((relative) {
                int index = controller.relatives.indexOf(relative);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        '${relative.relation} Details',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Relative Name
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: '${relative.relation} Name'),
                            onChanged: (value) {
                              controller.relatives[index].name = value;
                            },
                          ),
                          // Death Status
                          DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: 'Life Status'),
                            items: ['Alive', 'Died Before', 'Died After']
                                .map((status) {
                              return DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.relatives[index].deathStatus =
                                  value ?? 'Alive';
                              // Reset marital status if alive
                              if (value == 'Alive') {
                                controller.relatives[index].isMarried = false;
                              }
                            },
                            value: relative.deathStatus.isEmpty
                                ? null
                                : relative.deathStatus,
                            validator: (value) =>
                                value == null ? 'Please select a status' : null,
                          ),
                          // Is Married
                          if (relative.deathStatus == 'Died Before')
                            SwitchListTile(
                              title: const Text("Is Married"),
                              value: relative.isMarried,
                              onChanged: (value) {
                                controller.relatives[index].isMarried = value;
                                controller.updateState();
                              },
                            ),
                          // If married, ask for spouse details
                          if (relative.isMarried &&
                              (relative.deathStatus == 'Died Before' ||
                                  relative.deathStatus == 'Died After'))
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Spouse Name'),
                              onChanged: (value) {
                                controller.relatives[index].spouseName = value;
                              },
                            ),
                          // Collect children details if married
                          if (relative.isMarried &&
                              (relative.deathStatus == 'Died Before' ||
                                  relative.deathStatus == 'Died After'))
                            Column(
                              children: [
                                for (int i = 0; i < relative.sons; i++)
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Son ${i + 1} Name'),
                                    onChanged: (value) {
                                      // Update son name logic
                                    },
                                  ),
                                for (int i = 0; i < relative.daughters; i++)
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Daughter ${i + 1} Name'),
                                    onChanged: (value) {
                                      // Update daughter name logic
                                    },
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
              // .toList(),

              // Submit Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Check if all dropdowns have selected values
                    bool allValid = true;
                    for (var relative in controller.relatives) {
                      if (relative.deathStatus.isEmpty) {
                        allValid = false;
                        break;
                      }
                    }

                    if (controller.fatherAliveStatus.value.isEmpty ||
                        controller.motherAliveStatus.value.isEmpty) {
                      allValid = false;
                    }

                    if (allValid) {
                      relativesController
                          .submitRelativeData(); // Submit the data
                    } else {
                      Get.snackbar('Error', 'Please fill all required fields',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
