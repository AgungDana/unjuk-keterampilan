import 'package:iconsax/iconsax.dart';
import 'package:unjukketrampilan/common/button.dart';
import 'package:unjukketrampilan/common/snackbar/snackbar_popup.dart';
import 'package:unjukketrampilan/common/text_input.dart';
import 'package:unjukketrampilan/core/route/bloc_route.dart';
import 'package:unjukketrampilan/core/route/route_page.dart';
import 'package:unjukketrampilan/modules/login/bloc/bloc_login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocLogin = LoginBLoc();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masuk',
              ),
            ),
          ),
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: StreamTextInput(
              sStream: blocLogin.email,
              keyboardType: TextInputType.emailAddress,
              label: 'Email',
              hint: 'Masukkan Email',
            ),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: StreamTextInput(
              sStream: blocLogin.password,
              label: 'Password',
              hint: 'Masukkan Password',
              obscureText: true,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              textButton: 'Login',
              onTap: () async {
                await blocLogin.login();
                snacBarPopUp(
                  message: 'Berhasil Login',
                  icon: Iconsax.tick_square,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum mempunyai akun?',
              ),
              InkWell(
                onTap: () {
                  RouteBloc().push(RouteRegister());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  child: Text(
                    ' Daftar',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
