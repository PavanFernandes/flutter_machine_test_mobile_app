import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_machine_test_mobile_app/components/category_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final List<String> banners = [
    'assets/images/m2.jpg',
    'assets/images/m1.jpg',
    'assets/images/m3.jpg',
    'assets/images/m1.jpg',
    'assets/images/m2.jpg',
  ];

  final List<String> phones = [
    'assets/images/p3.jpg',
    'assets/images/p1.jpg',
    'assets/images/p2.jpeg',
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      foregroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search here',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                },
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(),
      ),
      backgroundColor: Colors.white,
      elevation: 2,
      shadowColor: Colors.grey,
    ),
      body: Container(

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
          
                Container(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: banners.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Card(
                          elevation: 0,
                          child: Container(
                            width: 270,
                            child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10), // Set your desired border radius
                                  child: Image(image: AssetImage(banners[index]), fit: BoxFit.fill,),
                                )
                          ),
                        ),
                      );
                    },
                  ),
                ),
          
                const SizedBox(height: 10,),
          
                Card(
                  child: Container(
                    width: 300,
                    height: 145,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                            colors: ([Colors.deepPurpleAccent, Colors.lightBlueAccent]),
                            begin : Alignment.topRight,
                            end : Alignment.bottomLeft
                        ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("KYC Pending", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),),
                          const SizedBox(height: 5,),
                          const Text("You need to provide required document for your account activation.", softWrap: true, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
                          const SizedBox(height: 5,),
                          TextButton(onPressed: (){}, child: const Text("Click Here", style: TextStyle(decoration: TextDecoration.underline, decorationColor: Colors.white, fontSize: 20, color: Colors.white,), ))
                        ],
                      ),
                    ),
                  ),
                ),
          
                const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CategoryButton(color: Colors.blue, label: "Mobile", icon: Icons.phone_android),
                          CategoryButton(color: Colors.green, label: "Laptop", icon: Icons.laptop_chromebook),
                          CategoryButton(color: Colors.pink, label: "Camera", icon: Icons.camera_alt_sharp),
                          CategoryButton(color: Colors.orange, label: "Tablet", icon: Icons.tablet),
                        ],
                      ),
                    ),

            Container(
              height: 440,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: ([Colors.blue, Colors.lightBlueAccent]),
                    begin : Alignment.topRight,
                    end : Alignment.bottomLeft
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Exclusive for you",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white,),
                        ),
                        SizedBox(width: 4,),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: phones.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5,),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white
                              ),
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: AssetImage(phones[index]),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Smartphone 5g,(128Gb)",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )


              ],
            ),
          ),
        ),
      ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(
                icon: Icon(Icons.handshake), label: "Deals"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profile"),
          ],
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
            currentIndex: currentPage,
            onTap: (index) {
            setState(() {
              currentPage = index;
            });
          }
        )
    );
  }

}