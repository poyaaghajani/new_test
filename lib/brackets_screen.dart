import 'package:flutter/material.dart';
import 'package:new_tset/models/tournament_draw_model.dart';
import 'package:new_tset/packages/flutter_tournament_bracket/src/flutter_tournament_bracket.dart';
import 'package:new_tset/packages/flutter_tournament_bracket/src/model/tournament_match.dart';
import 'package:new_tset/packages/flutter_tournament_bracket/src/model/tournament_model.dart';

class BracketsScreen extends StatefulWidget {
  const BracketsScreen({super.key});

  @override
  State<BracketsScreen> createState() => _BracketsScreenState();
}

class _BracketsScreenState extends State<BracketsScreen> {
  late TournamentDrawModel draw;

  @override
  void initState() {
    super.initState();

    draw = TournamentDrawModel(
      kind: "Singles",
      drawName: "Men's Singles",
      rounds: [
        // Round 1 - 16 players
        Round(
          id: "r1",
          name: "Round 1",
          index: 1,
          userDraws: [
            _match(
              "p1",
              "Novak",
              "Djokovic",
              "🇷🇸",
              1,
              "p2",
              "Rafael",
              "Nadal",
              "🇪🇸",
              2,
              "6-4",
              "3-6",
              "6-3",
              "p1",
            ),
            _match(
              "p3",
              "Roger",
              "Federer",
              "🇨🇭",
              3,
              "p4",
              "Andy",
              "Murray",
              "🇬🇧",
              4,
              "7-5",
              "6-4",
              "",
              "p3",
            ),
            _match(
              "p5",
              "Carlos",
              "Alcaraz",
              "🇪🇸",
              5,
              "p6",
              "Jannik",
              "Sinner",
              "🇮🇹",
              6,
              "6-3",
              "6-2",
              "",
              "p5",
            ),
            _match(
              "p7",
              "Stefanos",
              "Tsitsipas",
              "🇬🇷",
              7,
              "p8",
              "Daniil",
              "Medvedev",
              "🇷🇺",
              8,
              "6-4",
              "6-4",
              "",
              "p8",
            ),
            _match(
              "p9",
              "Alexander",
              "Zverev",
              "🇩🇪",
              9,
              "p10",
              "Casper",
              "Ruud",
              "🇳🇴",
              10,
              "6-4",
              "7-5",
              "",
              "p9",
            ),
            _match(
              "p11",
              "Taylor",
              "Fritz",
              "🇺🇸",
              11,
              "p12",
              "Frances",
              "Tiafoe",
              "🇺🇸",
              12,
              "4-6",
              "7-6",
              "6-4",
              "p12",
            ),
            _match(
              "p13",
              "Hubert",
              "Hurkacz",
              "🇵🇱",
              13,
              "p14",
              "Karen",
              "Khachanov",
              "🇷🇺",
              14,
              "6-3",
              "6-4",
              "",
              "p13",
            ),
            _match(
              "p15",
              "Matteo",
              "Berrettini",
              "🇮🇹",
              15,
              "p16",
              "Diego",
              "Schwartzman",
              "🇦🇷",
              16,
              "6-4",
              "6-2",
              "",
              "p15",
            ),
          ],
        ),
        // Quarterfinals - 8 players
        Round(
          id: "r2",
          name: "Quarterfinals",
          index: 2,
          userDraws: [
            _match(
              "p1",
              "Novak",
              "Djokovic",
              "🇷🇸",
              1,
              "p3",
              "Roger",
              "Federer",
              "🇨🇭",
              3,
              "6-4",
              "6-4",
              "",
              "p1",
            ),
            _match(
              "p5",
              "Carlos",
              "Alcaraz",
              "🇪🇸",
              5,
              "p8",
              "Daniil",
              "Medvedev",
              "🇷🇺",
              8,
              "6-7",
              "6-3",
              "6-4",
              "p5",
            ),
            _match(
              "p9",
              "Alexander",
              "Zverev",
              "🇩🇪",
              9,
              "p12",
              "Frances",
              "Tiafoe",
              "🇺🇸",
              12,
              "7-6",
              "6-2",
              "",
              "p9",
            ),
            _match(
              "p13",
              "Hubert",
              "Hurkacz",
              "🇵🇱",
              13,
              "p15",
              "Matteo",
              "Berrettini",
              "🇮🇹",
              15,
              "6-4",
              "6-4",
              "",
              "p13",
            ),
          ],
        ),
        // Semifinals - 4 players
        Round(
          id: "r3",
          name: "Semifinals",
          index: 3,
          userDraws: [
            _match(
              "p1",
              "Novak",
              "Djokovic",
              "🇷🇸",
              1,
              "p5",
              "Carlos",
              "Alcaraz",
              "🇪🇸",
              5,
              "6-3",
              "6-4",
              "",
              "p1",
            ),
            _match(
              "p9",
              "Alexander",
              "Zverev",
              "🇩🇪",
              9,
              "p13",
              "Hubert",
              "Hurkacz",
              "🇵🇱",
              13,
              "4-6",
              "6-3",
              "6-4",
              "p9",
            ),
          ],
        ),
        // Final - 2 players
        Round(
          id: "r4",
          name: "Winner",
          index: 4,
          userDraws: [
            _match(
              "p1",
              "Novak",
              "Djokovic",
              "🇷🇸",
              1,
              "p9",
              "Alexander",
              "Zverev",
              "🇩🇪",
              9,
              "6-4",
              "7-5",
              "",
              "p1",
            ),
          ],
        ),
      ],
    );
  }

  /// Helper function to create a match
  UserDraw _match(
    String p1Id,
    String p1First,
    String p1Last,
    String p1Flag,
    int p1Rank,
    String p2Id,
    String p2First,
    String p2Last,
    String p2Flag,
    int p2Rank,
    String set1,
    String set2,
    String set3,
    String winnerId,
  ) {
    return UserDraw(
      id: "${p1Id}_vs_$p2Id",
      playerOneId: p1Id,
      playerOneFirstName: p1First,
      playerOneLastName: p1Last,
      playerOneClub: "$p1Last Club",
      playerOneFlag: p1Flag,
      playerOneRank: p1Rank,
      playerTwoId: p2Id,
      playerTwoFirstName: p2First,
      playerTwoLastName: p2Last,
      playerTwoClub: "$p2Last Club",
      playerTwoFlag: p2Flag,
      playerTwoRank: p2Rank,
      isByePlayerOne: false,
      isByePlayerTwo: false,
      set1: set1,
      set2: set2,
      set3: set3,
      tieBreaks: "",
      status: "Completed",
      winnerId: winnerId,
      winnerFriendId: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Tournament> generateTournaments(TournamentDrawModel draw) {
      List<Tournament> tournaments = [];
      var rounds = draw.rounds;

      for (var round in rounds!) {
        tournaments.add(
          Tournament(
            matchHeaderTitle: round.name,
            matches: List.generate(round.userDraws!.length, (index) {
              var draw = round.userDraws![index];

              return TournamentMatch(
                id: draw.id ?? '',
                playerOne: (draw.playerOneFirstName?.isNotEmpty ?? false)
                    ? '${draw.playerOneFirstName} ${draw.playerOneLastName}'
                    : null,
                playerTwo: (draw.playerTwoFirstName?.isNotEmpty ?? false)
                    ? '${draw.playerTwoFirstName} ${draw.playerTwoLastName}'
                    : null,
                playerOneClub: draw.playerOneClub,
                playerTwoClub: draw.playerTwoClub,
                playerOneFlag: draw.playerOneFlag,
                playerTwoFlag: draw.playerTwoFlag,
                matchResult: (draw.set1?.isNotEmpty ?? false)
                    ? '${draw.set1} ${draw.set2} ${draw.set3}'
                    : null,
                playerOneRank: draw.playerOneRank,
                playerTwoRank: draw.playerTwoRank,
                playerOneId: draw.playerOneId,
                playerTwoId: draw.playerTwoId,
                winnerId: draw.winnerId,
                matchStatus: draw.status,
                isFinalWinner: round.name == 'Winner',
              );
            }),
          ),
        );
      }

      return tournaments;
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(child: Text('Ladders')),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Container(width: 200, height: 400, color: Colors.teal),
                  Expanded(
                    child: TournamentBracket(
                      list: generateTournaments(draw),
                      card: (item) {
                        return TournamentDetailDrawMatchCard(item: item);
                      },
                      itemsMarginVertical: 24,
                      cardWidth: 420,
                      cardHeight: 180,
                      lineWidth: 80,
                      lineThickness: 3,
                      lineBorderRadius: 8,
                      lineColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TournamentDetailDrawMatchCard extends StatelessWidget {
  const TournamentDetailDrawMatchCard({super.key, required this.item});

  final TournamentMatch item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPlayerRow(
              name: item.playerOne,
              club: item.playerOneClub,
              flag: item.playerOneFlag,
              rank: item.playerOneRank,
              isWinner: item.winnerId == item.playerOneId,
            ),
            const SizedBox(height: 8),
            _buildPlayerRow(
              name: item.playerTwo,
              club: item.playerTwoClub,
              flag: item.playerTwoFlag,
              rank: item.playerTwoRank,
              isWinner: item.winnerId == item.playerTwoId,
            ),
            const Divider(height: 20),
            if (item.matchResult != null)
              Text(
                item.matchResult!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            if (item.isFinalWinner ?? false)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "🏆 Winner",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerRow({
    String? name,
    String? club,
    String? flag,
    int? rank,
    bool isWinner = false,
  }) {
    return Row(
      children: [
        if (flag != null) Text(flag, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            name ?? "Bye",
            style: TextStyle(
              fontWeight: isWinner ? FontWeight.bold : FontWeight.normal,
              color: isWinner ? Colors.green : Colors.black,
            ),
          ),
        ),
        if (rank != null)
          Text("Rank $rank", style: const TextStyle(fontSize: 12)),
        if (club != null) ...[
          const SizedBox(width: 8),
          Text(
            "($club)",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ],
    );
  }
}
