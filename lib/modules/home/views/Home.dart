import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class Home extends StatelessWidget {
  final List<String> images = [
    "images/background.jpg",
    "images/coffee.jpg",
    "images/husky.jpg",
    "images/kingfisher.jpg",
    "images/phonewallpaper.jpg", 
    "images/water-lily.jpg"
  ];
  final List<BottomNavigationBarItem> item = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home_rounded) , label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart) , label: "Cart"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined) , label: "Wishlist"),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline) , label: "You")
  ];

  Widget _buildAppBar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(90.0),
      child: Container(
        margin: EdgeInsets.only(top:20.0 ,),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            child: Card(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  hintText: "Search products",
                  border: InputBorder.none,
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined), iconSize: 35.0,)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarOne(String title){
    
    return AppBar(
      bottom: PreferredSize(
        child: Container(
          color: Colors.grey.shade200,
          height:1.0,
        ),
        preferredSize: Size.fromHeight(1.0),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    final List<Widget> _appBars = [_buildAppBar(),_buildAppBarOne("Your Cart"),_buildAppBarOne("Your Wishlist"),_buildAppBarOne("You")];
    return Scaffold(
      appBar: _appBars[0] as PreferredSizeWidget?,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left:10.0 , right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.transparent,
                height: 150,
                padding: EdgeInsets.all(16.0),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  }, 
                  itemCount: images.length,
                  itemWidth: 200,
                  layout: SwiperLayout.STACK,
                )
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.deepOrange,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "NEW ARRIVALS",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    "SEE ALL",
                    style: TextStyle(
                      color: Colors.deepOrange
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                color: Colors.transparent,
                height: 350,
                padding: EdgeInsets.all(16.0),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight:Radius.circular(10.0)
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                images[index],
                              ),
                              fit: BoxFit.cover, 
                            ),
                          ) 
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)
                            )
                          ),
                          child: ListTile(
                            subtitle: Text("Awesome image caption"),
                            title: Text("Awesome image"),
                          ),
                        )
                      ]
                    );
                  },  
                  itemCount: images.length,
                  pagination: SwiperPagination(),
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              SizedBox(height: 10.0,),Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.deepOrange,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "daily needs".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    "SEE ALL",
                    style: TextStyle(
                      color: Colors.deepOrange
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Card(
                  elevation: 10.0,
                  child: Container(
                    padding: EdgeInsets.only(top: 12.0 , bottom: 12.0, left: 7.0),
                    height: 120.0,
                    child: InkWell(
                      splashColor: Colors.blueGrey.shade200,
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5.0,),
                          Expanded(
                            child: SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: Image.asset("images/coffee.jpg" , fit: BoxFit.cover,),
                            )
                          ),
                          SizedBox(width: 15.0,),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Coffee" , style: TextStyle(color: Colors.black , fontSize: 20.0),),
                                Text("1 kg" , style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
                                IconButton(onPressed: (){}, icon: Icon(Icons.add , color: Colors.deepOrange,size: 32.0,)),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Card(
                  elevation: 10.0,
                  child: Container(
                    padding: EdgeInsets.only(top: 12.0 , bottom: 12.0, left: 7.0),
                    height: 120.0,
                    child: InkWell(
                      splashColor: Colors.blueGrey.shade200,
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5.0,),
                          Expanded(
                            child: SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: Image.asset("images/coffee.jpg" , fit: BoxFit.cover,),
                            )
                          ),
                          SizedBox(width: 15.0,),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Coffee" , style: TextStyle(color: Colors.black , fontSize: 20.0),),
                                Text("1 kg" , style: TextStyle(color: Colors.grey))
                              ],
                            )
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
                                IconButton(onPressed: (){}, icon: Icon(Icons.add , color: Colors.deepOrange,size: 32.0,)),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0,
        items: item,
        currentIndex: 0,
        onTap:(index)=>{},
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey.shade800,
      ),
    );
  }
}