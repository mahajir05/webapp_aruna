import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../infrastructure/navigation/routes.dart';
import 'components.dart';

class ImageWrapper extends StatelessWidget {
  final String image;

  const ImageWrapper({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Listen to inherited widget width updates.
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Image.asset(
        image,
        width: width,
        height: width / 1.618,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TagWrapper extends StatelessWidget {
  final List<Tag> tags;

  const TagWrapper({Key? key, this.tags = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: paddingBottom24,
        child: Wrap(
          spacing: 8,
          runSpacing: 0,
          children: <Widget>[...tags],
        ));
  }
}

class Tag extends StatelessWidget {
  final String tag;

  const Tag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      fillColor: const Color(0xFF242424),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 0,
      hoverElevation: 0,
      hoverColor: const Color(0xFFC7C7C7),
      highlightElevation: 0,
      focusElevation: 0,
      child: Text(
        tag,
        style: GoogleFonts.openSans(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

class ReadMoreButton extends StatelessWidget {
  final Function()? onPressed;

  const ReadMoreButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(textPrimary),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return const BorderSide(color: textPrimary, width: 2);
          }

          return const BorderSide(color: textPrimary, width: 2);
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return Colors.white;
          }

          return textPrimary;
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return GoogleFonts.montserrat(
              textStyle: const TextStyle(fontSize: 14, color: Colors.white, letterSpacing: 1),
            );
          }

          return GoogleFonts.montserrat(
            textStyle: const TextStyle(fontSize: 14, color: textPrimary, letterSpacing: 1),
          );
        }),
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 12, vertical: 16)),
      ),
      child: const Text(
        "READ MORE",
      ),
    );
  }
}

const Widget divider = Divider(color: Color(0xFFEEEEEE), thickness: 1);
Widget dividerSmall = Container(
  width: 40,
  decoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0xFFA0A0A0),
        width: 1,
      ),
    ),
  ),
);

List<Widget> authorSection({String? imageUrl, String? name, String? bio}) {
  return [
    divider,
    Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        children: <Widget>[
          if (imageUrl != null)
            Container(
              margin: const EdgeInsets.only(right: 25),
              child: Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: Image.asset(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          Expanded(
            child: Column(
              children: <Widget>[
                if (name != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextHeadlineSecondary(text: name),
                  ),
                if (bio != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      bio,
                      style: bodyTextStyle,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
    divider,
  ];
}

class PostNavigation extends StatelessWidget {
  final Function()? onPreviousPressed;
  final Function()? onNextPressed;
  const PostNavigation({Key? key, this.onPreviousPressed, this.onNextPressed}) : super(key: key);

  // TODO Get PostID from Global Routing Singleton.
  // Example: String currentPage = RouteController.of(context).currentPage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: onPreviousPressed,
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.keyboard_arrow_left,
                size: 25,
                color: textSecondary,
              ),
              Text("PREVIOUS POST", style: buttonTextStyle),
            ],
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onNextPressed,
          child: Row(
            children: <Widget>[
              Text("NEXT POST", style: buttonTextStyle),
              const Icon(
                Icons.keyboard_arrow_right,
                size: 25,
                color: textSecondary,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ListNavigation extends StatelessWidget {
  const ListNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            const Icon(
              Icons.keyboard_arrow_left,
              size: 25,
              color: textSecondary,
            ),
            Text("NEWER POSTS", style: buttonTextStyle),
          ],
        ),
        const Spacer(),
        Row(
          children: <Widget>[
            Text("OLDER POSTS", style: buttonTextStyle),
            const Icon(
              Icons.keyboard_arrow_right,
              size: 25,
              color: textSecondary,
            ),
          ],
        )
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  // TODO Add additional footer components (i.e. about, links, logos).
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: const Align(
        alignment: Alignment.centerRight,
        child: TextBody(text: "Copyright © 2020"),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  // TODO replace with Post item model.
  final String title;
  final String? imageUrl;
  final String? description;
  final Function()? onPressed;

  const ListItem({Key? key, required this.title, this.imageUrl, this.description, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (imageUrl != null)
          ImageWrapper(
            image: imageUrl!,
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: marginBottom12,
            child: Text(
              title,
              style: headlineTextStyle,
            ),
          ),
        ),
        if (description != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: marginBottom12,
              child: Text(
                description!,
                style: bodyTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: marginBottom24,
            child: ReadMoreButton(
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * Menu/Navigation Bar
 *
 * A top menu bar with a text or image logo and
 * navigation links. Navigation links collapse into
 * a hamburger menu on screens smaller than 400px.
 */
class MenuBar extends StatelessWidget {
  final Function(String)? onSearchTyped;
  const MenuBar({Key? key, this.onSearchTyped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 32),
        InkWell(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => Get.offAllNamed(Routes.HOME),
          child: Text("WebApp",
              style: GoogleFonts.montserrat(
                  color: textPrimary, fontSize: 30, letterSpacing: 3, fontWeight: FontWeight.w500)),
        ),
        if (onSearchTyped != null)
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(top: 16, bottom: 32),
              alignment: Alignment.centerRight,
              child: Wrap(
                children: <Widget>[
                  TextField(
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "search content here..",
                      contentPadding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      // suffixIcon: IconButton(
                      //   icon: const Icon(Icons.search),
                      //   onPressed: () {},
                      //   iconSize: 30.0,
                      // ),
                      suffixIcon: const Icon(Icons.search),
                    ),
                    onChanged: onSearchTyped,
                  ),
                  // TextButton(
                  //   onPressed: () => Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName)),
                  //   style: menuButtonStyle,
                  //   child: const Text(
                  //     "HOME",
                  //   ),
                  // ),
                  // TextButton(
                  //   onPressed: () {},
                  //   style: menuButtonStyle,
                  //   child: const Text(
                  //     "PORTFOLIO",
                  //   ),
                  // ),
                  // TextButton(
                  //   onPressed: () => {},
                  //   style: menuButtonStyle,
                  //   child: const Text(
                  //     "STYLE",
                  //   ),
                  // ),
                  // TextButton(
                  //   onPressed: () {},
                  //   style: menuButtonStyle,
                  //   child: const Text(
                  //     "ABOUT",
                  //   ),
                  // ),
                  // TextButton(
                  //   onPressed: () {},
                  //   style: menuButtonStyle,
                  //   child: const Text(
                  //     "CONTACT",
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        Container(height: 1, margin: const EdgeInsets.only(bottom: 32), color: const Color(0xFFEEEEEE)),
      ],
    );
  }
}
