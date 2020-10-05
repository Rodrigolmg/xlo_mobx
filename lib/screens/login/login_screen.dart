import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/signup/errorbox_component.dart';
import 'package:xlo_mobx/screens/signup/signup_screen.dart';
import 'package:xlo_mobx/stores/login_store.dart';

class LoginScreen extends StatelessWidget {

  final loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Acessar com e-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Observer(
                        builder: (_) => Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ErrorBox(
                            message: loginStore.error,
                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    Observer(builder: (_) => TextField(
                        enabled: !loginStore.loading,
                        onChanged: loginStore.setEmail,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: email@gmail.com',
                            isDense: true,
                            errorText: loginStore.emailError
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Senha',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Esqueceu sua senha?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                  color: Colors.purple,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Observer(builder: (_) => TextField(
                        enabled: !loginStore.loading,
                        onChanged: loginStore.setPassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: loginStore.passwordError
                        ),
                        obscureText: true,
                      ),
                    ),
                    Observer(
                      builder: (_) => Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        height: 40,
                        child: RaisedButton(
                          onPressed: loginStore.loginPressed,
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          child: loginStore.buttonLabel,
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.black38,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            'Não tem um conta?',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => SignUpScreen()
                                )
                              );
                            },
                            child: Text(
                              'Cadastra-se',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
