import 'package:experiments/app_level/styles/theme.dart';
import 'package:experiments/app_level/utilities/screen_size.dart';
import 'package:flutter/material.dart';

class ParallaxButton extends StatefulWidget {
  const ParallaxButton({
    Key? key,
    //  this.model
  }) : super(key: key);

  // final ArticleModel model;

  @override
  _ParallaxButtonState createState() => _ParallaxButtonState();
}

class _ParallaxButtonState extends State<ParallaxButton> {
  ShapeBorder get shape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      );

  double get _height => ScreenQueries.instance.height(context);
  double get _width => ScreenQueries.instance.width(context);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (_width * 0.15).roundToDouble(),
      height: (_width * 0.15).roundToDouble(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onPanStart: (DragStartDetails details) {},
            onPanUpdate: (DragUpdateDetails details) {},
            onPanEnd: (DragEndDetails details) {},
            onPanCancel: () {},
            onPanDown: (DragDownDetails details) {},
            child: Stack(fit: StackFit.expand, children: [
              Card(
                color: AppTheme.darkTheme.primaryColor, // AppColors.brandColor,
                margin:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24),
                elevation: 8, // TODO:
                shape: shape,
                child: Column(
                  children: [
                    // Expanded(
                    //   flex: 2,
                    //   child: ClipRRect(
                    //     borderRadius: const BorderRadius.vertical(
                    //       top: Radius.circular(32),
                    //     ),
                    //     child: ImageWidgetPlaceholder(),
                    //   )
                    // )
                    Expanded(
                      child: Container(
                        color: Colors.grey.shade200,
                        // child: Text('${widget.model}'),
                        // child: Text(
                        // model: widget.model,
                        // )
                      ),
                    )
                  ],
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
