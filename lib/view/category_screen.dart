import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/models/news_channel_headlines_model.dart';
import 'package:provider/provider.dart';

import '../view_model/category_view_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);
  String categoryName = 'General';

  final format = DateFormat('MMMM dd. yyyy');
  var newsFuture;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,(){
      newsFuture = Provider.of<CategoryViewModel>(context,listen: false);

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

      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
           SizedBox(
             height: 70,
             child: ListView(
               scrollDirection: Axis.horizontal,
               children: [
                 ValueListenableBuilder<bool>(
                     valueListenable: isSelected ,
                     builder: (context,bool value,child){
                       return Row(
                           children: [
                             InkWell(
                               onTap: ()async{
                                 await newsFuture.fetchGeneralCategoryNews();

                               },
                               child: Container(
                                 height: 50,
                                 width: width * 0.3,

                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: isSelected.value ? Colors.blue : Colors.grey,

                                 ),
                                 child: Center(child: Text('General',style: GoogleFonts.poppins(
                                     fontSize: 14,
                                     color: Colors.white
                                 ),),),
                               ),
                             ),
                             const SizedBox(width: 10,),
                             InkWell(
                               onTap: () async{
                                 await newsFuture.fetchEntertainmentNews();
                               },
                               child: Container(
                                 height: 50,
                                 width: width * 0.3,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: isSelected.value ? Colors.blue : Colors.grey,
                                 ),
                                 child: Center(child: Text('Entertaintment',style: GoogleFonts.poppins(
                                     fontSize: 14,
                                     color: Colors.white
                                 ),),),
                               ),
                             ),
                             const SizedBox(width: 10,),
                             InkWell(
                               onTap: () async{
                                 await newsFuture.fetchHealthNews();

                               },
                               child: Container(
                                 height: 50,
                                 width: width * 0.3,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: isSelected.value ? Colors.blue : Colors.grey,
                                 ),
                                 child: Center(child: Text('Health',style: GoogleFonts.poppins(
                                     fontSize: 14,
                                     color: Colors.white
                                 ),),),
                               ),
                             ),
                             const SizedBox(width: 10,),
                             InkWell(
                               onTap: () async{
                                 await newsFuture.fetchSportsNews();

                               },
                               child: Container(
                                 height: 50,
                                 width: width * 0.3,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: isSelected.value ? Colors.blue : Colors.grey,
                                 ),
                                 child: Center(child: Text('Sports',style: GoogleFonts.poppins(
                                     fontSize: 14,
                                     color: Colors.white
                                 ),),),
                               ),
                             ),
                             const SizedBox(width: 10,),
                             InkWell(
                               onTap: () async{
                                 await newsFuture.fetchBusinessNews();

                               },
                               child: Container(
                                 height: 50,
                                 width: width * 0.3,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: isSelected.value ? Colors.blue : Colors.grey,
                                 ),
                                 child: Center(child: Text('Business',style: GoogleFonts.poppins(
                                     fontSize: 14,
                                     color: Colors.white
                                 ),),),
                               ),
                             ),
                             const SizedBox(width: 10,),
                             InkWell(
                               onTap: () async{
                                 await newsFuture.fetchTechnologyNews();

                               },
                               child: Container(
                                 height: 50,
                                 width: width * 0.3,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   color: isSelected.value ? Colors.blue : Colors.grey,
                                 ),
                                 child: Center(child: Text('Technology',style: GoogleFonts.poppins(
                                     fontSize: 14,
                                     color: Colors.white
                                 ),),),
                               ),
                             ),
                           ],
                         );
                 })

        ]
             ),
           ),
             const SizedBox(height: 20,),
             Expanded(
               child: FutureBuilder<bool>(
                  future: newsFuture.fetchCategoryNewsHeadlines(categoryName),
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
      ),
    );
  }

}

const spinKit2 = SpinKitFadingCircle(
  color: Color(0xffe302a7),
  size: 50,
);
