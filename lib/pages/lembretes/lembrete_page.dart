import 'dart:developer';

import 'package:aula_flutter/db/database.dart';
import 'package:aula_flutter/models/lembretes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aula_flutter/widgets/custom_edit.dart';
import 'package:aula_flutter/widgets/custom_logo.dart';

import '../../widgets/custom_button.dart';

class LembretePage extends StatefulWidget {
  const LembretePage({super.key});

  @override
  State<LembretePage> createState() => _LembretePageState();
}

class _LembretePageState extends State<LembretePage> {
  final TextEditingController textTitulo = TextEditingController();
  final TextEditingController textDescricao = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Adicionar Lembrete'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            // Campos titulo e descrição
            children: [
              const SizedBox(height: 200),
              CustomEdit(
                controller: textTitulo,
                hintText: 'Informe o titulo',
                icon: Icons.title,
                validator: (value) {
                  if (value == null) {
                    return "Informe o titulo";
                  }

                  if (value.trim() == "") {
                    return "Informe o titulo";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomEdit(
                controller: textDescricao,
                hintText: 'Informe a descricao',
                icon: Icons.description,
                validator: (value) {
                  if (value == null) {
                    return "Informe a descricao";
                  }

                  if (value.trim() == "") {
                    return "Informe a descricao";
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Verifica se o titulo já existe usando a função
          if (_formKey.currentState!.validate()) {
            bool verificarTituloForm =
                Database().verificarTitulo(textTitulo.text.trim());

            // Retorna mensagem se titulo já existir
            if (verificarTituloForm == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Titulo já usado...'),
                ),
              );
            }
            // Se titulo não existir adiciona novo lembrete
            if (verificarTituloForm == false) {
              Database().addLembrete(Lembrete(
                codigo: Database().lembretes.length,
                titulo: textTitulo.text,
                descricao: textDescricao.text,
              ));

              print(Database().lembretes.length);

              Navigator.pop(context);
            }
          }
        },
        label: const Text('Salvar Lembrete'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
