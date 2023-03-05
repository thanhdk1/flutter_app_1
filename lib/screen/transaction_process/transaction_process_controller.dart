import 'package:pvoil_station/common/core/sys/base_controller.dart';

class TransactionProcessController extends BaseController {
  @override
  Future initialData() async {
    await fetchData();
  }

  @override
  Future<void> fetchData() async {
  }
}
