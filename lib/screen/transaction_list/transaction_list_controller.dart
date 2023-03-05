import 'package:pvoil_station/common/core/sys/base_controller.dart';

class TransactionListController extends BaseController {
  @override
  Future initialData() async {
    await fetchData();
  }

  @override
  Future<void> fetchData() async {
  }
}
