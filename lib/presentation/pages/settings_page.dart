import 'dart:developer';

import 'package:chickenman/presentation/them/them.dart';
import 'package:chickenman/presentation/widgets/app_bar_widget.dart';
import 'package:chickenman/presentation/widgets/btn_widget.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AppBarWidget(title: "Settings"),
                SizedBox(height: 60.h),
                SizedBox(
                  height: 222.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainBtnWiget(
                        title: "Contact us",
                        onTap: () async {
                          String? encodeQueryParameters(
                            Map<String, String> params,
                          ) {
                            return params.entries
                                .map(
                                  (MapEntry<String, String> e) =>
                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
                                )
                                .join('&');
                          }

                          // ···
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'elzoxilo51405@gmail.com',
                            query: encodeQueryParameters(<String, String>{
                              '': '',
                            }),
                          );
                          try {
                            if (await canLaunchUrl(emailLaunchUri)) {
                              await launchUrl(emailLaunchUri);
                            } else {
                              throw Exception(
                                "Could not launch $emailLaunchUri",
                              );
                            }
                          } catch (e) {
                            log(
                              'Error launching email client: $e',
                            ); // Log the error
                          }
                        },
                      ),
                      MainBtnWiget(
                        title: "Privacy policy",
                        onTap: () async {
                          final Uri url = Uri.parse(
                            'https://docs.google.com/document/d/1jsISyS8cPXeNGTLNconAfqeWX-Gx7vxgSjhxzWsyNI8/mobilebasic',
                          );
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                      ),
                      MainBtnWiget(
                        title: "Rate us",
                        onTap: () async {
                          InAppReview.instance.openStoreListing(
                            appStoreId: '6748816160',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Image.asset("assets/menu.png", width: 402.w, height: 402.h),
          ],
        ),
      ),
    );
  }
}
