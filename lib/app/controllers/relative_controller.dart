import 'package:get/get.dart';
import 'package:shajra_app/app/controllers/inheritence_controller.dart';

import '../models/relative_model.dart';
import '../ui/shajra_screen.dart';

class RelativesController extends GetxController {
  final deceasedController = Get.put(InheritanceController());
  // Relatives list
  var relatives = <Relative>[].obs;

  // Alive status for parents
  var fatherAliveStatus = ''.obs;
  var motherAliveStatus = ''.obs;

  void initializeRelatives(List<Map<String, dynamic>> relativeData) {
    relatives.clear();

    for (var data in relativeData) {
      relatives.add(Relative(
        relation: data['relation'] ?? '',
        name: data['name'] ?? '',
        deathStatus: data['deathStatus'] ?? 'Alive',
        isMarried: data['isMarried'] ?? false,
        spouseName: data['spouseName'], // Add spouse name
        sons: data['sons'] ?? 0,
        daughters: data['daughters'] ?? 0,
      ));
    }

    update();
  }

  // Method to handle alive status update for a specific relative
  void updateAliveStatus(int index, String status) {
    // Check if index is within bounds
    if (index < 0 || index >= relatives.length) {
      return; // Prevent out-of-bounds access
    }

    // Update the death status
    relatives[index].deathStatus = status;

    // If the status is 'Died Before', reset marriage status and children details
    if (status == 'Died Before') {
      relatives[index].isMarried = false; // Reset marriage status
      relatives[index].sons = 0; // Reset sons count
      relatives[index].daughters = 0; // Reset daughters count
      relatives[index].spouseName = null; // Reset spouse name if necessary
    }

    update(); // Notify the UI to update the status
  }

  // Method to handle the submission logic
  void submitRelativeData() {
    // Perform any validation or calculations needed based on relatives' data
    Get.to(() => ShajraScreen()); // Navigate to family tree screen
  }
}
