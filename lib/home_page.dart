import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String respostaFinal = '';
  final dio = Dio();
  Map<String, dynamic>? endereco;

  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://viacep.com.br/ws/76870740/json/');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meu app'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text('Consumo de API DIO'),
          ElevatedButton(onPressed: () async {
                Map<String, dynamic>? enderecoAuxiliar = await getHttp();
                setState(() {
                  endereco = enderecoAuxiliar;
                });
              },child: Text('Consultar')),
          SizedBox(height: 32,),
          Text('${endereco?['logradouro'] ?? ''}'),
          Text('${endereco?['complemento'] ?? ''}'),
          Text('${endereco?['bairro'] ?? ''}'),
          Text('${endereco?['localidade'] ?? ''}'),
          Text('${endereco?['estado'] ?? ''}'),
        ],
      ),
    );
  }
}
