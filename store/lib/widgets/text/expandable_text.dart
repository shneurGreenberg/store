import 'package:flutter/material.dart';
import 'package:store/utils/colors.dart';
import 'package:store/utils/dimensions.dart';
import 'package:store/widgets/text/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf, secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.getHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              height: 1.7,
              color: AppColors.paracolor,
              size: Dimensions.font16,
              text: firstHalf,
            )
          : Column(
              children: [
                SmallText(
                    height: 1.7,
                    size: Dimensions.font16,
                    color: AppColors.paracolor,
                    text: hiddenText
                        ? (firstHalf + "...")
                        : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        height: 1.7,
                        size: Dimensions.font16,
                        color: AppColors.paracolor,
                        text: hiddenText ? "Read more" : "Read less",
                      ),
                      Icon(
                        hiddenText
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
                //
              ],
            ),
    );
  }
}
