import 'package:new_tset/packages/flutter_tournament_bracket/src/model/tournament_match.dart';

class Tournament {
  Tournament({required this.matches, this.matchHeaderTitle});

  final List<TournamentMatch> matches;
  final String? matchHeaderTitle;
}
