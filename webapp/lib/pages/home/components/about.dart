// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../models/about.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

CollectionReference aboutData = FirebaseFirestore.instance.collection('about');
final getAboutData =
    StreamProvider.autoDispose<QuerySnapshot>((ref) => aboutData.snapshots());

class AboutSection extends ConsumerWidget {
  const AboutSection({Key? key}) : super(key: key);

//   @override
//   State<AboutSection> createState() => _AboutSectionState();
// }

// class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context, ref) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, ref),
      tablet: _buildUi(kTabletMaxWidth, ref),
      mobile: _buildUi(getMobileMaxWidth(context), ref),
    );
  }

  Widget _buildUi(double width, WidgetRef ref) {
    final stream = ref.watch(getAboutData);
    return stream.when(
        data: (QuerySnapshot? value) {
          About about =
              About.fromMap(value!.docs[0].data() as Map<String, dynamic>);

          return Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ResponsiveWrapper(
                  maxWidth: width,
                  minWidth: width,
                  defaultScale: false,
                  child: Flex(
                    direction: constraints.maxWidth > 720
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      Expanded(
                        flex: constraints.maxWidth > 720.0 ? 1 : 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'About us',
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.w900,
                                height: 1.3,
                                fontSize: 35.0,
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              about.title,
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                                fontSize: 24.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              about.description,
                              style: const TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                                fontSize: 15.0,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            // const Text(
                            //   "Technology I have worked with",
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 10.0,
                            // ),
                            // Consumer(builder: (context, ref, _) {
                            //   return ScrollConfiguration(
                            //     behavior: ScrollConfiguration.of(context)
                            //         .copyWith(scrollbars: false),
                            //     child: SingleChildScrollView(
                            //       scrollDirection: Axis.horizontal,
                            //       child: Row(
                            //         children: TechnologyConstants
                            //             .technologyLearned
                            //             .map((e) => MouseRegion(
                            //                   cursor: SystemMouseCursors.click,
                            //                   child: Container(
                            //                     decoration: BoxDecoration(
                            //                       color: ref
                            //                               .watch(themeProvider)
                            //                               .isDarkMode
                            //                           ? Colors.grey[800]
                            //                           : Colors.grey[200],
                            //                       borderRadius:
                            //                           BorderRadius.circular(
                            //                               4.0),
                            //                     ),
                            //                     margin:
                            //                         const EdgeInsets.symmetric(
                            //                             horizontal: 5),
                            //                     padding:
                            //                         const EdgeInsets.symmetric(
                            //                             horizontal: 8.0,
                            //                             vertical: 6),
                            //                     child: InkWell(
                            //                       onTap: () {},
                            //                       child: Center(
                            //                         child: Row(
                            //                           children: [
                            //                             SizedBox(
                            //                                 width: 20,
                            //                                 height: 20,
                            //                                 child: Image.asset(
                            //                                     e.logo)),
                            //                             const SizedBox(
                            //                               width: 10,
                            //                             ),
                            //                             Text(
                            //                               e.name,
                            //                               style:
                            //                                   const TextStyle(
                            //                                 fontSize: 12.0,
                            //                                 fontWeight:
                            //                                     FontWeight.bold,
                            //                               ),
                            //                             ),
                            //                           ],
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ))
                            //             .toList(),
                            //       ),
                            //     ),
                            //   );
                            // }),
                            const SizedBox(
                              height: 70.0,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      if (ScreenHelper.isDesktop(context) ||
                          ScreenHelper.isTablet(context))
                        Expanded(
                          flex: constraints.maxWidth > 720.0 ? 1 : 0,
                          child: SvgPicture.asset(
                            AppConstants.personSvg,
                            width: constraints.maxWidth > 720.0 ? null : 350.0,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          );
        },
        loading: () {
          return const CircularProgressIndicator();
        },
        error: (value, stack) => const Text('error'));
  }
}
