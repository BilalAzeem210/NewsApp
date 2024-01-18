import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/models/news_channel_headlines_model.dart';
import 'package:newsapp/view/category_screen.dart';
import 'package:newsapp/view/new_details_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../view_model/category_view_model.dart';
import '../view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String name = 'bbc-news';
  final format = DateFormat('MMMM dd. yyyy');
  var newsFuture,categoryFuture;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, (){
    newsFuture = Provider.of<NewsViewModel>(context,listen: false);
    categoryFuture = Provider.of<CategoryViewModel>(context,listen: false);

    setState(() {

    });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.sizeOf(context).width * 1;
   final height = MediaQuery.sizeOf(context).height *1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, PageTransition(child: const  CategoryScreen(), type: PageTransitionType.rightToLeft));
          },
          icon: Image.asset('images/category_icon.png', height: 25, width: 25,),
        ),
        title: Center(child:
        Text('News',style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),),
      ),
        actions: [
          PopupMenuButton(
            color: Colors.white,

            icon: const Icon(Icons.more_vert,color: Colors.black,),
            itemBuilder: (ctx) {
              return <PopupMenuItem>[
                PopupMenuItem(child: InkWell(
                  onTap: () async{
                    Navigator.of(context).pop();
                    await newsFuture.fetchBbcNewsHeadlines();
                  },
                  child: Container(
                    height: 25,
                    width: width,
                    child: const Text('Bbc News', style: TextStyle(color: Colors.black),),
                  ),
                )),
                PopupMenuItem(child: InkWell(
                  onTap: () async{
                    Navigator.of(context).pop();
                    await newsFuture.fetchCnnNewsHeadlines();
                  },
                  child: Container(
                    height: 25,
                    width: width,
                    child: const Text('Cnn News', style: TextStyle(color: Colors.black),),
                  ),
                )),
                PopupMenuItem(child: InkWell(
                  onTap: () async{
                    Navigator.of(context).pop();
                    await newsFuture.fetchAryNewsHeadlines();
                  },
                  child: Container(
                    height: 25,
                    width: width,
                    child: const Text('Ary-News', style: TextStyle(color: Colors.black),),
                  ),
                )),
                PopupMenuItem(child: InkWell(
                  onTap: () async{
                    Navigator.of(context).pop();
                    await newsFuture.fetchRecuterNewsHeadlines();
                  },
                  child: Container(
                    height: 25,
                    width: width,
                    child: const Text('Recuter-News', style: TextStyle(color: Colors.black),),
                  ),
                )),
                PopupMenuItem(child: InkWell(
                  onTap: () async{
                    Navigator.of(context).pop();
                    await newsFuture.fetchAlJazeeraNewsHeadlines();
                  },
                  child: SizedBox(
                    height: 25,
                    width: width,
                    child: const Text('Al-Jazeera', style: TextStyle(color: Colors.black),),
                  ),
                )),
                PopupMenuItem(child: InkWell(
                  onTap: () async{
                    Navigator.of(context).pop();
                    await newsFuture.fetchBloombergNewsHeadlines();
                  },
                  child: SizedBox(
                    height: 25,
                    width: width,
                    child: const Text('Bloomberg', style: TextStyle(color: Colors.black),),
                  ),
                )),


              ];
            }
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .55,
            width: width,
            child: FutureBuilder<bool>(
              future: newsFuture.fetchNewsChannelHeadlines('bbc-news'),
              builder: (context,snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting)
                {
                  return const Center(
                    child: SpinKitRipple(
                      color: Colors.black,
                      size: 40,
                    ),
                  );
                }
                else {
                  return Consumer<NewsViewModel>(
                    builder: (context, value, child){
                       if (kDebugMode) {
                         print('Channel Wise:');
                       }
                      var data = value.newsChannelHeadlines;
                      return SizedBox(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: data!.articles!.length,
                            itemBuilder: (context, index){
                              DateTime date = DateTime.parse(data!.articles![index].publishedAt.toString());
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, PageTransition(
                                      child: NewsDetailScreen(
                                        newsImage: data!.articles![index].urlToImage.toString(),
                                        newsTitle: data!.articles![index].title.toString(),
                                        newsDate: data!.articles![index].publishedAt.toString(),
                                        author: data!.articles![index].author.toString(),
                                        description: data!.articles![index].description.toString(),
                                        source: data!.articles![index].source.name.toString(),
                                        content: data!.articles![index].content.toString(),


                                      ),
                                      type: PageTransitionType.rightToLeft));
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: height * 0.6,
                                      width: width * .9,
                                      padding: EdgeInsets.symmetric(horizontal: height * .02),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: CachedNetworkImage(
                                          imageUrl: data!.articles![index].urlToImage.toString(),
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Container(child: spinKit2),
                                          errorWidget: (context, url, error) => const Icon(Icons.error_outline,color: Colors.red,),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 18,
                                      child: Card(
                                        color: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        child: Container(
                                          alignment: Alignment.bottomCenter,
                                          height: height * .22,
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: width * 0.7,
                                                child: Text(data!.articles![index].title.toString(),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 17,fontWeight: FontWeight.w700),),
                                              ),
                                              const Spacer(),
                                              SizedBox(
                                                width: width * 0.7,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(data!.articles![index].source!.name.toString(),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w600
                                                      ),),
                                                    Text(format.format(date),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w500
                                                      ),)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                        ),
                      );
                    },

                  );

                }

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FutureBuilder<bool>(
              future: categoryFuture.fetchCategoryNewsHeadlines('General'),
              builder: (context,snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting)
                {
                  return const Center(
                    child: SpinKitRipple(
                      color: Colors.black,
                      size: 40,
                    ),
                  );
                }
                else {
                  return Consumer<CategoryViewModel>(
                    builder: (context, value, child){
                      print('Channel Wise:');
                      var data = value.categoryNewsHeadlines;
                      return ListView.builder(
                        shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: data!.articles!.length,
                          itemBuilder: (context, index){
                            DateTime date = DateTime.parse(data!.articles![index].publishedAt.toString());
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      imageUrl: data!.articles![index].urlToImage.toString(),
                                      fit: BoxFit.cover,
                                      height: height * .20,
                                      width: width * .3,
                                      placeholder: (context, url) => Container(child: spinKit2),
                                      errorWidget: (context, url, error) => const Icon(Icons.error_outline,color: Colors.red,),
                                    ),
                                  ),


                                ),
                                Expanded(
                                    child: Container(
                                      height: height * .20,
                                      padding: EdgeInsets.only(left: 15),
                                      child:Column(
                                        children: [
                                          Text(data!.articles![index].title.toString(),
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700
                                            ),),
                                          Spacer(),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(data!.articles![index].source.name.toString(),
                                                  maxLines: 3,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.w500
                                                  ),),
                                                SizedBox(width: 50,),
                                                Text(format.format(date),

                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400
                                                  ),),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            );
                          }
                      );
                    },

                  );

                }

              },
            ),
          ),
        ],
      ),
    );
  }
}

const spinKit2 = SpinKitFadingCircle(
  color: Color(0xffe302a7),
  size: 50,
);
