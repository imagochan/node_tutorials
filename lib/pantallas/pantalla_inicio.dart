import 'package:apptickets/pantallas/crear_tickets/pantalla_crear_ticket.dart';
import 'package:apptickets/pantallas/home_elev_btn.dart';
import 'package:flutter/material.dart';
import 'package:apptickets/pantallas/listar_tickets/pantalla_listar_tickets.dart';
import 'package:apptickets/pantallas/actualizar_tickets/pantalla_actualizar_tickets.dart';

import '../modelos/modelo_ticket.dart';

//Pantalla de inicio que aloja los botones para crear, listar, actualizar y borrar tickets
//Utilizamos Navigator y Routes para mover al usuario entre pantallas

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("App para tickets en línea"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeElevBtn(
                pageWidget: FormCrearEditarTicket(esCrearOActualizar: true,unTicket: Ticket.empty(),),
                btnTitle: 'Crear Ticket',
              ),
              const SizedBox(
                height: 10,
              ),
              const HomeElevBtn(
                pageWidget: ListarTickets(),
                btnTitle: 'Listar Ticket',
              ),
            ],
          ),
        ));
  }
}
