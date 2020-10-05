import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/signup/errorbox_component.dart';
import 'package:xlo_mobx/components/signup/field_title_component.dart';
import 'package:xlo_mobx/screens/login/login_screen.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {

  final signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
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
                    Observer(
                      builder: (_) => ErrorBox(
                        message: signupStore.error
                      )
                    ),
                    FieldTitleComponent(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios',
                    ),
                    Observer(
                      builder: (_) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setName,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: Ronaldo N.',
                            errorText: signupStore.nameError,
                            isDense: true
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitleComponent(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação',
                    ),
                    Observer(builder: (_) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setEmail,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Exemplo: email@gmail.com',
                            isDense: true,
                          errorText: signupStore.emailError
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitleComponent(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer(builder: (_) => TextField(
                      enabled: !signupStore.loading,
                      onChanged: signupStore.setPhone,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '(99) 99999-9999',
                            isDense: true,
                          errorText: signupStore.phoneError
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitleComponent(
                      title: 'Senha',
                      subtitle: 'Use letras, números e caracteres especiais',
                    ),
                    Observer(builder: (_) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setFirstPassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                          errorText: signupStore.firstPassError
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldTitleComponent(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita a senha',
                    ),
                    Observer(builder: (_) => TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setSecondPassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: signupStore.secondPassError
                        ),
                        obscureText: true,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 12),
                      height: 40,
                      child: Observer(builder: (_) => RaisedButton(
                          onPressed: signupStore.signUpPressed,
                          color: Colors.orange,
                          child: signupStore.buttonLabel,
                          textColor: Colors.white,
                          disabledColor: Colors.orange.withAlpha(120),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      )
                    ),
                    Divider(color: Colors.black38,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const Text(
                            'Já tem  conta?',
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
                                      builder: (_) => LoginScreen()
                                  )
                              );
                            },
                            child: Text(
                              'Entrar',
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
