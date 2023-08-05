import 'package:flutter/material.dart';
import 'package:node_tutorials/services/api.dart';

class CrearTicket extends StatefulWidget {
  const CrearTicket({super.key});

  @override
  State<CrearTicket> createState() => _CrearTicketState();
}

class _CrearTicketState extends State<CrearTicket> {
  var tituloController = TextEditingController();
  var descripcionController = TextEditingController();
  var fechaVencimientoController = TextEditingController();
  var fechaPublicacionController = TextEditingController();
  var fechaFinPublicacionController = TextEditingController();
  var valorCompraController = TextEditingController();
  var categoriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ingrese datos del ticket a crear"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: tituloController,
                  decoration: const InputDecoration(
                    hintText: "ingrese el titulo del ticket",
                  ),
                ),
                TextField(
                  controller: descripcionController,
                  decoration: const InputDecoration(
                      hintText: "Ingrese la descripción del ticket"),
                ),
                TextField(
                  controller: fechaVencimientoController,
                  decoration: const InputDecoration(
                    hintText: "Ingrese la fecha de vencimiento del ticket",
                  ),
                ),
                TextField(
                  controller: fechaPublicacionController,
                  decoration: const InputDecoration(
                      hintText: "Ingrese la fecha de publicación del ticket"),
                ),
                TextField(
                  controller: fechaFinPublicacionController,
                  decoration: const InputDecoration(
                      hintText:
                          "Ingrese la fecha de fin de publicación del ticket"),
                ),
                TextField(
                  controller: valorCompraController,
                  decoration: const InputDecoration(
                      hintText: "Ingrese el valor de compra del ticket"),
                ),
                TextField(
                  controller: categoriaController,
                  decoration: const InputDecoration(
                      hintText: "Ingrese la categoria del ticket"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      var data = {
                        "ttitulo": tituloController.text,
                        "tdescripcion": descripcionController.text,
                        "tfechaVencimiento": fechaVencimientoController.text,
                        "tfechaPublicacion": fechaPublicacionController.text,
                        "tfechaFinPublicacion":
                            fechaFinPublicacionController.text,
                        "tvalorCompra": valorCompraController.text,
                        "tcategoria": categoriaController.text
                      };

                      Api.addTicket(data);
                    },
                    child: const Text("Crear ticket"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
