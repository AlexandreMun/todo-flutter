import 'package:aula_flutter/models/lembretes.dart';
import 'package:aula_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:aula_flutter/db/database.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Inicio'),
        automaticallyImplyLeading: false,
        // Adiciona icone e leva para a tela de usuarios
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed(
                  Routes.USUARIOS,
                );
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, ${Database().usuarioLogado?.nome ?? ""}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Você tem ${Database().lembretes.length}" " lembretes.",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: Database().lembretes.length,
                  itemBuilder: (context, index) {
                    var item = Database().lembretes.elementAt(index);

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
                                const Icon(Icons.calendar_month),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        item.titulo,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        item.descricao,
                                      ),
                                    ],
                                  ),
                                ),
                                // Adiciona opção de remover lembrete
                                IconButton(
                                  // Executa ação de remover ao clicar usando a função
                                  onPressed: () {
                                    setState(() {
                                      Database().removeLembrete(item);
                                    });
                                  },
                                  // Adiciona icone
                                  icon: const Icon(Icons.delete),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(
            Routes.LEMBRETES,
          );

          setState(() {
            // Database().addLembrete(
            //   Lembrete(
            //     codigo: Database().lembretes.length + 1,
            //     titulo: "Titulo Teste",
            //     descricao: "Descricao Teste",
            //   ),
            // );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
