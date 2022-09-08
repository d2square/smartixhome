import 'package:smartix/networking/provider/api.dart';
import 'package:get/get.dart';
import 'package:smartix/screens/login_page/application/controller/login_controller.dart';
import 'package:smartix/screens/login_page/domain/i_sign_in_repo.dart';
import 'package:smartix/screens/login_page/domain/signin_api_repository.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient());
    Get.lazyPut<ISignInRepo>(
        () => SignInApiRepository(apiClient: Get.find()));
    Get.put(LoginController(iSignInRepo: Get.find()),permanent: true);
  }
}
