/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';

class VxTwo extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final Color titleColor;
  final String subtitle;
  final TextSpan subtitle2;
  final TextSpan subtitle3;
  final double subtitleFontSize;
  final Color subtitleColor;
  final bool isSubtitleBold;
  final bool isHorizontal;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final int maxLinesSubtitle;

  const VxTwo({
    Key key,
    @required this.title,
    this.titleFontSize = 16.0,
    this.titleColor = Colors.black,
    @required this.subtitle,
    this.subtitle2,
    this.subtitle3,
    this.subtitleFontSize = 14.0,
    this.subtitleColor,
    this.isSubtitleBold = false,
    this.isHorizontal = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.maxLinesSubtitle = 1,
  })  : assert(title != null),
        assert(subtitle != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final list = [
      Text(
        title,
        style: TextStyle(fontSize: titleFontSize, color: titleColor),
      ),
      if (isHorizontal) 8.widthBox else 8.heightBox,
      Text.rich(
        TextSpan(
          text: subtitle,
          children: [
            subtitle2 ?? const TextSpan(),
            subtitle3 ?? const TextSpan(),
          ],
        ),
        maxLines: maxLinesSubtitle,
        textAlign: TextAlign.justify,
        softWrap: true,
        style: TextStyle(
          fontWeight: isSubtitleBold ? FontWeight.bold : FontWeight.normal,
          fontSize: subtitleFontSize,
          textBaseline: TextBaseline.alphabetic,
          color: subtitleColor,
        ),
      )
    ];
    if (isHorizontal) {
      return Row(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: list,
      );
    } else {
      return Column(
        key: key,
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: list,
      );
    }
  }
}

class VxTwoColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;

  const VxTwoColumn({Key key, @required this.top, @required this.bottom})
      : assert(top != null),
        assert(bottom != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        top,
        10.heightBox,
        bottom,
      ],
    );
  }
}

class VxTwoRow extends StatelessWidget {
  final Widget left;
  final Widget right;

  const VxTwoRow({Key key, @required this.left, @required this.right})
      : assert(left != null),
        assert(right != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      key: key,
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        left,
        10.widthBox,
        right,
      ],
    );
  }
}

class VelocityTwoIconColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final Widget icon;

  const VelocityTwoIconColumn(
      {Key key, @required this.top, @required this.bottom, @required this.icon})
      : assert(top != null),
        assert(bottom != null),
        assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        top,
        10.heightBox,
        Row(
          children: <Widget>[
            icon,
            10.widthBox,
            bottom,
          ],
        ),
      ],
    );
  }
}
