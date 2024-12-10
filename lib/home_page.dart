import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String respostaFinal = '';
  final dio = Dio();

  Future<String> getHttp() async {
    final response = await dio.get('https://viacep.com.br/ws/76870740/json/');
    return response.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text('Consumo de API DIO'),
          ElevatedButton(
            onPressed: () async {
              final resultado = await getHttp();
              setState(() {
                respostaFinal = resultado;
              });
            },
            child: Text('Consultar'),
          ),
          SizedBox(height: 32),
          Text(respostaFinal),
        ],
      ),
    );
  }
}
