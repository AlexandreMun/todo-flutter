import 'package:aula_flutter/db/database.dart';
import 'package:aula_flutter/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // Quantidade de usuarios
              "${Database().lembretes.length} usuários cadastrados.",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: Database().usuarios.length,
                  itemBuilder: (context, index) {
                    // Pega os dados dos usuarios
                    var user = Database().usuarios.elementAt(index);

                    // Insere os dados na interface
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Material(
                        color: Colors.grey.shade100,
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            height: 80,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 20),
                                const Icon(Icons.person),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        user.nome,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Email: ${user.email}",
                                      ),
                                      Text(
                                        "Senha: ${user.senha}",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
