class TournamentMatch {
  TournamentMatch({
    required this.id,
    this.playerOne,
    this.playerTwo,
    this.matchDate,
    this.playerOneScore,
    this.playerTwoScore,
    this.playerOneClub,
    this.playerTwoClub,
    this.playerOneFlag,
    this.playerTwoFlag,
    this.matchResult,
    this.playerOneRank,
    this.playerTwoRank,
    this.playerOneId,
    this.playerTwoId,
    this.winnerId,
    this.matchStatus,
    this.isFinalWinner,
  });

  final String id;

  final String? playerOne;

  final String? playerTwo;

  final DateTime? matchDate;

  final String? playerOneScore;

  final String? playerTwoScore;

  final String? playerOneClub;

  final String? playerTwoClub;

  final String? playerOneFlag;

  final String? playerTwoFlag;

  final String? matchResult;

  final int? playerOneRank;

  final int? playerTwoRank;

  final String? playerOneId;

  final String? playerTwoId;

  final String? winnerId;

  final String? matchStatus;

  final bool? isFinalWinner;
}
