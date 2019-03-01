import 'package:flutter/material.dart';
import 'package:info_apps_flutter/Library/intro_views_flutter-2.4.0/lib/Models/page_view_model.dart';

/// This is the class which contains the Page UI.
class Page extends StatelessWidget {
  ///page details
  final PageViewModel pageViewModel;

  ///percent visible of page
  final double percentVisible;

  /// [MainAxisAligment]
  final MainAxisAlignment columnMainAxisAlignment;

  //Constructor
  Page({
    this.pageViewModel,
    this.percentVisible = 1.0,
    this.columnMainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      color: pageViewModel.pageColor,
      child: Opacity(
        //Opacity is used to create fade in effect
        opacity: percentVisible,
        child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitPage()
              : __buildLandscapePage();
        }), //OrientationBuilder
      ),
    );
  }

  /// when device is Portrait place title, image and body in a column
  Widget _buildPortraitPage() {
    return Column(
      mainAxisAlignment: columnMainAxisAlignment,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: _ImagePageTransform(
            percentVisible: percentVisible,
            pageViewModel: pageViewModel,
          ),
        ), //Transform
        Flexible(
          flex: 1,
          child: _TitlePageTransform(
            percentVisible: percentVisible,
            pageViewModel: pageViewModel,
          ),
        ), //Transform
        Flexible(
          flex: 2,
          child: _BodyPageTransform(
            percentVisible: percentVisible,
            pageViewModel: pageViewModel,
          ),
        ), //Transform
      ],
    );
  }

  /// if Device is Landscape reorder with row and column
  Widget __buildLandscapePage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: _ImagePageTransform(
            percentVisible: percentVisible,
            pageViewModel: pageViewModel,
          ),
        ), //Transform

        Flexible(
          child: Column(
            mainAxisAlignment: columnMainAxisAlignment,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _TitlePageTransform(
                percentVisible: percentVisible,
                pageViewModel: pageViewModel,
              ), //Transform
              _BodyPageTransform(
                percentVisible: percentVisible,
                pageViewModel: pageViewModel,
              ), //Transform
            ],
          ), // Column
        ),
      ],
    );
  }
}

/// Body for the Page.
class _BodyPageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _BodyPageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //Used for vertical transformation
      transform:
          Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 185.0,
          left: 10.0,
          right: 10.0,
        ),
        child: DefaultTextStyle.merge(
          style: pageViewModel.bodyTextStyle,
          textAlign: TextAlign.center,
          child: pageViewModel.body,
        ),
      ), //Padding
    );
  }
}

/// Main Image of the Page
class _ImagePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _ImagePageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //Used for vertical transformation
      transform:
          Matrix4.translationValues(0.0, 50.0 * (1 - percentVisible), 0.0),
      child: Padding(
        padding: EdgeInsets.only(
          top: 60.0,
          bottom: 0.0,
        ),
        child: Container(
          width: double.infinity,
          child: pageViewModel.mainImage, //Loading main
        ), //Container
      ), //Padding
    );
  }
}

/// Title for the Page
class _TitlePageTransform extends StatelessWidget {
  final double percentVisible;

  final PageViewModel pageViewModel;

  const _TitlePageTransform({
    Key key,
    @required this.percentVisible,
    @required this.pageViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      //Used for vertical transformation
      transform:
          Matrix4.translationValues(0.0, 30.0 * (1 - percentVisible), 0.0),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 0.0,
          left: 10.0,
          right: 10.0,
        ),
        child: DefaultTextStyle.merge(
          style: pageViewModel.titleTextStyle,
          child: pageViewModel.title,
        ),
      ), //Padding
    );
  }
}
