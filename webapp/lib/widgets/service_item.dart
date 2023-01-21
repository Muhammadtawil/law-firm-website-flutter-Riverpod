// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/theme.dart';

class ServiceItem extends ConsumerStatefulWidget {
  const ServiceItem({
    Key? key,
    required this.id,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.isAvailable,
  }) : super(key: key);
  final String id;
  final String title;
  final String description;
  final String imageurl;
  final bool isAvailable;
  @override
  ConsumerState<ServiceItem> createState() => _ServiceItemState();
}

final servicesData = FirebaseFirestore.instance.collection("services");
final getAboutData = StreamProvider.autoDispose<QuerySnapshot>(
    (ref) => servicesData.snapshots());

class _ServiceItemState extends ConsumerState<ServiceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ref.watch(themeProvider).isDarkMode
            ? const Color.fromARGB(75, 12, 12, 7)
            : Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: ref.watch(themeProvider).isDarkMode
                  ? Colors.grey[900]
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(80),
            ),
            child: Icon(
              Icons.mobile_friendly,
              color: Colors.green[400]!,
              size: 52,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.josefinSans(
              color: ref.watch(themeProvider).isDarkMode
                  ? Colors.grey[400]
                  : Colors.grey[800],
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}


  // Consumer(builder: (context, ref, _) {
  //           return Wrap(
  //               alignment: WrapAlignment.center,
  //               crossAxisAlignment: WrapCrossAlignment.center,
  //               runAlignment: WrapAlignment.center,
  //               children: whatIDo
  //                   .map((e) => Container(
  //                         height: 200,
  //                         width: 200,
  //                         margin: const EdgeInsets.all(20),
  //                         decoration: BoxDecoration(
  //                           color: ref.watch(themeProvider).isDarkMode
  //                               ? const Color.fromARGB(75, 12, 12, 7)
  //                               : Colors.grey[50],
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             Container(
  //                               width: 80,
  //                               height: 80,
  //                               decoration: BoxDecoration(
  //                                 color: ref.watch(themeProvider).isDarkMode
  //                                     ? Colors.grey[900]
  //                                     : Colors.grey[200],
  //                                 borderRadius: BorderRadius.circular(80),
  //                               ),
  //                               child: Icon(
  //                                 e.iconData,
  //                                 color: e.color,
  //                                 size: 52,
  //                               ),
  //                             ),
  //                             const SizedBox(
  //                               height: 20,
  //                             ),
  //                             Text(
  //                               e.title,
  //                               textAlign: TextAlign.center,
  //                               style: GoogleFonts.josefinSans(
  //                                 color: ref.watch(themeProvider).isDarkMode
  //                                     ? Colors.grey[400]
  //                                     : Colors.grey[800],
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.w800,
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       ))
  //                   .toList());
  //         }),