import 'package:currency_converter_app/provider/api_provider.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';
import '../utils/global_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fromcurracy = "0";
  DropdownEditingController<String> contry1 = DropdownEditingController();
  DropdownEditingController<String> contry2 = DropdownEditingController();

  @override
  void initState() {
    super.initState();
    // CurrencyHelper.currencyHelper.convertCurrency(want: "USD", have: "INR", amount: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Currency Converter",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Switch(
                  activeColor: Colors.black,
                  inactiveThumbColor: Colors.black,
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDark,
                  onChanged: (val) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme();

                  })
            ],
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color:  Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35, left: 35),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 160),
                        child: TextDropdownFormField(
                          options: country,
                          controller: contry1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              labelStyle: TextStyle(fontSize: 20,color: Theme.of(context).buttonColor),
                              labelText: "From",
                              suffixStyle: TextStyle(fontSize: 40)),
                          dropdownHeight: 350,
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            "${fromcurracy}",
                            style: TextStyle(fontSize: 25,color: Theme.of(context).buttonColor),
                          ),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.grey,
                        thickness: 1,

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.arrow_downward_rounded),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, right: 160),
                        child: TextDropdownFormField(
                          options: country,
                          controller: contry2,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              labelStyle: TextStyle(fontSize: 20,color: Theme.of(context).buttonColor),
                              labelText: "To",
                              suffixStyle: TextStyle(fontSize: 40)),
                          dropdownHeight: 400,
                        ),
                      ),

                      Row(
                        children: [
                          Text((Provider.of<CurrencyProvider>(context).amounts?.amount== null)?"":
                           "${ Provider.of<CurrencyProvider>(context).amounts?.amount}",
                            style: TextStyle(fontSize: 25,color: Theme.of(context).buttonColor),
                          ),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          // CurrencyHelper.currencyHelper.convertCurrency(
                          //     want:"${contry2.value}" ,
                          //     have: "${contry1.value}",
                          //     amount: "${originalPrice}");
                          Provider.of<CurrencyProvider>(context,listen: false).convertCurrencies(want: "${contry2.value}", have: "${contry1.value}", amount: "${fromcurracy}");
                          print("${contry1.value}");
                          print("${contry2.value}");

                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          child: Center(
                            child: Text(
                              'Convert',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  Theme.of(context).backgroundColor),
                        ),
                      )
                    ],
                  ),
                ),


                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 400,
                            width: 250,
                            child: GridView.count(
                              crossAxisCount: 3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              children: [
                                Button("7"),
                                Button("8"),
                                Button("9"),
                                Button("4"),
                                Button("5"),
                                Button("6"),
                                Button("1"),
                                Button("2"),
                                Button("3"),
                                Button("00"),
                                Button("0"),
                                Button("."),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 170,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                fromcurracy = "0";


                              });
                            },
                            child: Text(
                              "AC",
                              style: TextStyle(fontSize: 25),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary:  Theme.of(context).backgroundColor,
                              elevation: 0,
                              shape: StadiumBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 170,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(
                                () {
                                  fromcurracy = fromcurracy.substring(
                                      0, fromcurracy.length - 1);
                                },
                              );
                            },
                            child: Icon(Icons.backspace_outlined),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).backgroundColor,
                              elevation: 0,
                              shape: StadiumBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  Button(String num) {
    return Container(
      height: 40,
      width: 40,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xffEEEEEE),
        onPressed: () {
          setState(
            () {
              if (fromcurracy == "0") {
                fromcurracy = num;
              } else {
                fromcurracy = "$fromcurracy$num";
              }
            },
          );
        },
        child: Text(
          num,
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
      ),
    );
  }
}
