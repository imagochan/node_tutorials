import 'package:flutter/material.dart';
import 'package:apptickets/servicios/api.dart';
import 'package:apptickets/modelos/modelo_ticket.dart';

class ListarTickets extends StatelessWidget {
  const ListarTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          //Llamamos a la API de recolectar tickets de forma asíncrona
          //Para desplegar los tickets dentro de la App
          future: Api.getTicket(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //Mostramos una pantalla de carga mientras esperamos la información.
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
              //Si recibimos datos, procedemos a desplegarlos
            } else {
              //Agregamos los datos recibidos a una lista
              //para manipular mas facilmente la información
              List<Ticket> tdata = snapshot.data;

              return ListView.builder(
                itemCount: tdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Column(
                      children: [
                        Text("Titulo: ${tdata[index].titulo}"),
                        Text("Descripción: ${tdata[index].descripcion}"),
                        Text(
                            "Fecha de Vencimiento: ${tdata[index].fechaVencimiento.toString()}"),
                        Text(
                            "Fecha de Publicación: ${tdata[index].fechaPublicacion.toString()}"),
                        Text(
                            "Fecha de fin de Publicación: ${tdata[index].fechaFinPublicacion.toString()}"),
                        Text(
                            "Valor de la compra: ${tdata[index].valorCompra.toString()}"),
                        Text("Categoria: ${tdata[index].categoria}"),
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
