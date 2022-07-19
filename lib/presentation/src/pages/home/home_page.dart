import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/src/pages/history/history_page.dart';
import 'package:tyba_restaurant/presentation/src/pages/home/home_controller.dart';
import 'package:tyba_restaurant/presentation/src/utils/assets.dart';
import 'package:tyba_restaurant/presentation/widgets/form_field_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return GetBuilder<HomeController>(
        id: 'places',
        builder: (_) {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                // Importante: elimina cualquier padding del ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xff192646),
                    ),
                    child: Center(
                      child: Column(
                        children: const [
                          Text('Bienvenido',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Icon(
                            Icons.restaurant_menu,
                            size: 80,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    hoverColor: Colors.transparent,
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: const <Widget>[
                        Icon(
                          Icons.history,
                          color: Color(0xff192646),
                          size: 25,
                        ), // icon-1
                      ],
                    ),
                    title: const Text('Historial',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Get.to(const HistoryPage());
                    },
                  ),
                  ListTile(
                    hoverColor: Colors.transparent,
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: const <Widget>[
                        Icon(
                          Icons.logout,
                          color: Color(0xff192646),
                          size: 25,
                        ), // icon-1
                      ],
                    ),
                    title: const Text('Cerrar sesión',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        barrierColor: Colors.black38,
                        enableDrag: false,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return SizedBox(
                            height: height,
                            child: Center(
                                child: Image.asset(
                              Assets.loading,
                              height: 200,
                            )),
                          );
                        },
                      );
                      _.signOut();
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                elevation: 50,
                backgroundColor: const Color(0xff192646),
                child: const Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  _.getLocation();
                }),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: const Text('Mapas'),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      FormInputFieldWithIcon(
                        onChanged: (p0) {
                          _.searchValue = p0;
                        },
                        iconPrefix: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        labelText: 'Buscar',
                        formValidation: _.form.data['search'],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff192646),
                                padding: const EdgeInsets.only(
                                    left: 40, right: 40, top: 15, bottom: 15)),
                            onPressed: () {
                              _.search();
                              _.form.data['search']!.value = '';
                            },
                            child: const Text(
                              'Buscar',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            _.places[index].name ?? '',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.restaurant_menu,
                                            color: Colors.orangeAccent,
                                          )
                                        ],
                                      ),
                                      Text(
                                        _.places[index].formattedAddress ?? '',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (conext, index) {
                                return const SizedBox(
                                  height: 30,
                                );
                              },
                              itemCount: _.places.length))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
