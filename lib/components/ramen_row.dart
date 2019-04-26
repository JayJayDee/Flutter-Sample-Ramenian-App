import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_sample/entities/ramen.dart';
import 'package:flutter_sample/styles.dart';
import 'package:flutter_sample/components/ramen_tag.dart';

typedef RamenSelectListener (Ramen ramen);

class RamenRow extends StatelessWidget {

  final Ramen ramen;
  final RamenSelectListener onSelect;

  RamenRow({
    this.ramen,
    this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(
              imageUrl: ramen.image,
              width: 80,
              height: 80
            )
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(ramen.company),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(ramen.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.primaryFontColor,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(_soupExpr(ramen)) // 국물여부
                  ]
                ),
                Row(
                  children: _ramenTagsWidgets(ramen.tags),
                )
              ]
            )
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.black,
          )
        ]
      )
    );
  }
}

String _soupExpr(Ramen ramen) =>
  ramen.hasSoup ? '국물있음' : '국물없음';

List<RamenTag> _ramenTagsWidgets(List<String> tags) =>
  tags.map((t) => RamenTag(tag: t)).toList();