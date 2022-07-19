import 'package:bloc/bloc.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:equatable/equatable.dart';

part 'auth_page_state.dart';

enum AuthPageType {
  first_screen,
  sign_in,
  register,
  forgot_password,
  verify_otp,
  complete_profile,
}

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit() : super(AuthPageInitial());

  Future<void> pageChange(AuthPageType type, {User? user}) async {
    if (type == AuthPageType.register) {
      emit(RegisterPage());
    } else if (type == AuthPageType.forgot_password) {
      emit(ForgotPasswordPage());
    } else if (type == AuthPageType.verify_otp) {
      emit(VerifyOtpPage());
    } else if (type == AuthPageType.sign_in) {
      emit(SignInPage());
    } else if (type == AuthPageType.complete_profile) {
      emit(CompleteProfilePage(
        user: user!,
      ));
    } else {
      emit(FirstPage());
    }
  }
}
