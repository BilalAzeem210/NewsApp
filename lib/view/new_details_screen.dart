import 'package:cached_network_image/cached_network_image.dart';
import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class NewsDetailScreen extends StatefulWidget {
  final String newsImage, newsTitle, newsDate, author, description, content, source;
  const NewsDetailScreen({super.key,
   required this.newsImage,
    required this.newsTitle,
    required this.newsDate,
    required this.author,
    required this.description,
    required this.content,
    required this.source,

});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final format = new DateFormat('MMMM dd,yyyy');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    DateTime dateTime = DateTime.parse(widget.newsDate);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: height *.40,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ),
              child: CachedNetworkImage(
                imageUrl: widget.newsImage,
                fit: BoxFit.cover,
                placeholder: (context,url) => const Center(child: CircularProgressIndicator(),),
              ),
            ),
          ),
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height * .4),
            padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
            ),
            child: ClipRRect(

              child: ListView(
                children: [
                  Text(widget.newsTitle,style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: height * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.source,style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,

                        ),),
                      ),
                      Text(format.format(dateTime),style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),)
                    ],
                  ),
                  SizedBox(height: height * .04,),
                  Text(widget.description,style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,),)
                ],
              ),
            ),
          )


        ],
      ),


    );
  }
}
