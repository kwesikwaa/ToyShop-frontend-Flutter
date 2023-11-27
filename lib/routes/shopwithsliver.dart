import 'package:flutter/material.dart';
import 'package:toyshop/Models/example_toylist.dart';
import 'package:toyshop/components/toyItem.dart';
import 'package:toyshop/components/toydetail.dart';

class ShopWithSliverRoute extends StatefulWidget {
  const ShopWithSliverRoute({super.key});

  @override
  State<ShopWithSliverRoute> createState() => _ShopWithSliverRouteState();
}

class _ShopWithSliverRouteState extends State<ShopWithSliverRoute> {

  final searchCtrl = TextEditingController();

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            LimitedBox(
              maxHeight: MediaQuery.of(context).size.height*.06,
              child: TextField(
                onSubmitted: (value){/*print('-=-=-=-on done triggered-=-=$value');*/},
                onEditingComplete: (){/*print("--=-=entered-=-=- '${searchCtrl.text}' was searched ");*/},
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  border: OutlineInputBorder(),
                  hintText: 'Search Toy',
                  prefixIcon: Icon(Icons.search,size: 30,)
                ),
                  
                controller: searchCtrl,
                
              ),
            ),
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (context, val){
                  return [
                    SliverAppBar(
                      // backgroundColor: Colors.deepPurple,
                      floating: true,
                      pinned: true,
                      expandedHeight: 250,
                      title: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(7)
                        ),
                        child: const Text('Coming Soon',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          padding: const EdgeInsets.only(top:10),
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Scrollbar(
                            trackVisibility: true,
                            thumbVisibility: true,
                            thickness: 10,
                            radius: const Radius.circular(15),
                            interactive: true,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: AllToys.upcomings.length,
                              itemBuilder: (builder, index){
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ToyDetail(toy: AllToys.upcomings[index])));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8, bottom: 15),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                    clipBehavior: Clip.antiAlias,
                                    width: MediaQuery.of(context).size.width/1.5,
                                    height: 160,
                                    child: Image.asset(AllToys.upcomings[index].thumbnail, fit: BoxFit.cover),
                                  ),
                                );
                              }),
                          ),
                        ),
                      ),
                  
                      bottom: TabBar(
                        // indicatorSize: TabBarIndicatorSize.tab,
                        indicator: UnderlineTabIndicator(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(width: 5),
                          insets: const EdgeInsets.symmetric(horizontal: 50)  
                        ),
                        tabs: const [
                          Tab(child: Text('als', style: TextStyle(color: Colors.black87),)),
                          Tab(text: 'cars',),
                          Tab(text: 'characters',),
                        ]),
                    )
                  ];
                },
                body: Expanded(
                      child: TabBarView(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                // crossAxisSpacing: 10,
                                // mainAxisSpacing: 10,
                                childAspectRatio: 150/195,
                                // mainAxisExtent: 180
                              ),
                              itemCount: AllToys.stock.length,
                              scrollDirection: Axis.vertical, 
                              itemBuilder: (context, index){
                                final item = AllToys.stock[index];
                                return ToyItem(toy: item); 
                              }
                            ),
                          ),
                          const Center(child: Text('cars'),),
                          const Center(child: Text('character'),)
                        ],
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}