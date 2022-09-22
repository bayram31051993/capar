import 'package:capar/app/data/services/storage_provider.dart';
import 'package:get/get.dart';
import 'package:capar/core/utils/enums.dart';

class TrekController extends GetxController {
  final RxList<String> tracksNumbers = <String>[].obs;

  @override
  void onInit() {
    reloadTrackNums();
    super.onInit();
  }

  reloadTrackNums() {
    tracksNumbers.value = PrvStorage().getListValues(enmStorageKeys.trackNums);
  }

  deleteNumber(String numToBeDel) {
    tracksNumbers.remove(numToBeDel);
  }

  addTrackNumber(String trackNum) {
    if (trackNum.isEmpty) return;
    tracksNumbers.add(trackNum);
    PrvStorage().addToList(enmStorageKeys.trackNums, trackNum);
  }

  @override
  void onClose() {
    PrvStorage().saveValue(enmStorageKeys.trackNums, tracksNumbers);
    super.onClose();
  }
}
