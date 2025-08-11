import 'package:flutter/material.dart';
import 'package:new_tset/packages/flutter_tournament_bracket/src/model/tournament_match.dart';
import 'package:new_tset/packages/flutter_tournament_bracket/src/model/tournament_model.dart';
import 'package:new_tset/packages/flutter_tournament_bracket/src/utils/calculate_separator_height.dart';

import 'widgets/bracket_match_card.dart';

class TournamentBracket extends StatelessWidget {
  const TournamentBracket({
    super.key,
    this.itemsMarginVertical = 20.0,
    this.cardHeight = 100.0,
    this.cardWidth = 220.0,
    this.card,
    required this.list,
    this.lineColor = Colors.green,
    this.lineBorderRadius = 10.0,
    this.lineWidth = 60.0,
    this.lineThickness = 5.0,
  }) : assert(
         lineThickness <= cardHeight / 2,
         "The line thickness must not exceed half the card height. Ensure that 'lineThickness' ($lineThickness) is <= 'cardHeight / 2' (${cardHeight / 2}).",
       );

  final double itemsMarginVertical;

  final double cardHeight;

  final double cardWidth;

  final Widget Function(TournamentMatch match)? card;

  final Color lineColor;

  final double lineBorderRadius;

  final double lineWidth;

  final double lineThickness;

  final List<Tournament> list;

  @override
  Widget build(BuildContext context) {
    double separatorH = itemsMarginVertical;
    final totalHeight =
        ((list.first.matches.length * cardHeight) +
        ((list.first.matches.length - 1) * separatorH) +
        100);

    return SizedBox(
      height: totalHeight,
      child: InteractiveViewer(
        minScale: 0.1,
        maxScale: 3.0,
        boundaryMargin: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        constrained: false,
        child: SizedBox(
          height: totalHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, index) {
              final Tournament item = list[index];
              separatorH = calculateSeparatorHeight(
                groupsSize: index,
                itemsMarginVertical: itemsMarginVertical,
                cardHeight: cardHeight,
              );
              return _MatchesList(
                cardWidth: cardWidth,
                cardHeight: cardHeight,
                card: card,
                matchCount: item.matches.length,
                separatorHeight: separatorH,
                matches: item.matches,
                matchHeaderTitle: item.matchHeaderTitle,
              );
            },
            separatorBuilder: (_, index) {
              final Tournament item = list[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: lineWidth,
                      child: ListView.separated(
                        itemCount: item.matches.length ~/ 2,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: (separatorH + cardHeight),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(lineBorderRadius),
                                    ),
                                    border: Border(
                                      top: BorderSide(
                                        color: lineColor,
                                        width: lineThickness,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                      ),
                                      right: BorderSide(
                                        color: lineColor,
                                        width: lineThickness,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                      ),
                                      bottom: BorderSide(
                                        color: lineColor,
                                        width: lineThickness,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: lineThickness,
                                  height: lineThickness,
                                  color: lineColor,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (_, index) {
                          return SizedBox(height: (cardHeight + separatorH));
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MatchesList extends StatelessWidget {
  const _MatchesList({
    required this.matchCount,
    required this.separatorHeight,
    this.cardHeight = 100.0,
    this.cardWidth = 220.0,
    this.card,
    required this.matches,
    this.matchHeaderTitle,
  });

  final int matchCount;

  final double separatorHeight;

  final double? cardHeight;

  final double? cardWidth;

  final Widget Function(TournamentMatch match)? card;

  final List<TournamentMatch> matches;

  final String? matchHeaderTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth ?? 220.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // if (matchHeaderTitle != null) ...[
          //   Text(
          //     matchHeaderTitle!,
          //     style: AppStyles.bodySmallBold(context),
          //   ),
          // ],
          Flexible(
            child: ListView.separated(
              itemCount: matches.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final TournamentMatch item = matches[index];

                return SizedBox(
                  height: cardHeight ?? 100.0,
                  child: card != null
                      ? card!(item)
                      : BracketMatchCard(item: item),
                );
              },
              separatorBuilder: (_, int index) {
                return Container(height: separatorHeight);
              },
            ),
          ),
        ],
      ),
    );
  }
}
