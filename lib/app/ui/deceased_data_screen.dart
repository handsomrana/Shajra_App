import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shajra_app/app/classes/person.dart';
import '../controllers/inheritence_controller.dart';
import 'relative_screen.dart'; // Import the RelativeScreen

class DeceasedPersonScreen extends StatelessWidget {
  final InheritanceController controller = Get.put(InheritanceController());
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  DeceasedPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deceased Person Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<InheritanceController>(
          builder: (controller) {
            return Form(
              key: _formKey, // Assign the form key
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Deceased Person Name
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Deceased Name'),
                    onChanged: (value) {
                      controller.deceasedPersonName.value = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the deceased name';
                      }
                      return null;
                    },
                  ),

                  // Deceased Person Gender
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Gender'),
                    value: ((controller.deceasedPersonGender == Gender.male) ||
                            (controller.deceasedPersonGender == Gender.female))
                        ? null
                        : controller.deceasedPersonGender.toString(),
                    items: ['Male', 'Female']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value == 'Male') {
                        controller.deceasedPersonGender = Gender.male;
                      } else if (value == 'Female') {
                        controller.deceasedPersonGender = Gender.female;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select gender';
                      }
                      return null;
                    },
                    hint: const Text('Select Gender'),
                  ),

                  // Father Name
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Father Name'),
                    onChanged: (value) {
                      controller.deceasedPersonFatherName.value = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the father\'s name';
                      }
                      return null;
                    },
                  ),

                  // Mother Name
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Mother Name'),
                    onChanged: (value) {
                      controller.deceasedPersonMotherName.value = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the mother\'s name';
                      }
                      return null;
                    },
                  ),

                  // Marital Status
                  // Obx(() =>
                  DropdownButtonFormField<String>(
                    decoration:
                        const InputDecoration(labelText: 'Marital Status'),
                    value: ((controller.deceasedPersonMaritalStatus ==
                                MaritalStatus.married) ||
                            (controller.deceasedPersonMaritalStatus ==
                                MaritalStatus.unmarried))
                        ? null
                        : controller.deceasedPersonMaritalStatus.toString(),
                    items: ['Married', 'Unmarried']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value == 'Married') {
                        controller.deceasedPersonMaritalStatus =
                            MaritalStatus.married;
                      } else {
                        controller.deceasedPersonMaritalStatus =
                            MaritalStatus.unmarried;
                      }
                      controller.update();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select marital status';
                      }
                      return null;
                    },
                    hint: const Text('Select Marital Status'),
                  ),
                  // ),

                  // Number of Brothers
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Number of Brothers'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      controller.deceasedPersonBrothers.value =
                          int.tryParse(value) ?? 0;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the number of brothers';
                      }
                      return null;
                    },
                  ),

                  // Number of Sisters
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Number of Sisters'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      controller.deceasedPersonSisters.value =
                          int.tryParse(value) ?? 0;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the number of sisters';
                      }
                      return null;
                    },
                  ),

                  // Conditionally show Sons and Daughters fields if marital status is 'Married'
                  // Obx(
                  //   () {
                  GetBuilder<InheritanceController>(
                    builder: (controller) {
                      if (controller.deceasedPersonMaritalStatus ==
                          MaritalStatus.married) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Number of Sons
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Number of Sons'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.deceasedPersonSons.value =
                                    int.tryParse(value) ?? 0;
                              },
                              validator: (value) {
                                if (controller.deceasedPersonMaritalStatus ==
                                        MaritalStatus.married &&
                                    (value == null || value.isEmpty)) {
                                  return 'Please enter the number of sons';
                                }
                                return null;
                              },
                            ),

                            // Number of Daughters
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Number of Daughters'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                controller.deceasedPersonDaughters.value =
                                    int.tryParse(value) ?? 0;
                              },
                              validator: (value) {
                                if (controller.deceasedPersonMaritalStatus ==
                                        MaritalStatus.married &&
                                    (value == null || value.isEmpty)) {
                                  return 'Please enter the number of daughters';
                                }
                                return null;
                              },
                            ),
                          ],
                        );
                      } else {
                        return Container(); // Return an empty container if unmarried
                      }
                    },
                  ),
                  // },
                  // ),

                  const SizedBox(height: 20),

                  // Navigate to RelativeScreen
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.onSubmitData();
                          controller.generateRelativeForms();
                          Get.to(() => RelativeScreen());
                        }
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
