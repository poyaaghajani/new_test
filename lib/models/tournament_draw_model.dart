class TournamentDrawModel {
  final String? kind;
  final String? drawName;
  final List<Round>? rounds;

  TournamentDrawModel({
    required this.kind,
    required this.drawName,
    required this.rounds,
  });

  factory TournamentDrawModel.fromJson(Map<String, dynamic> json) {
    return TournamentDrawModel(
      kind: json['kind'] as String?,
      drawName: json['drawName'] as String?,
      rounds: (json['rounds'] as List?)
          ?.map((e) => Round.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Round {
  final String? id;
  final String? name;
  final int? index;
  final List<UserDraw>? userDraws;

  Round({
    required this.id,
    required this.name,
    required this.index,
    required this.userDraws,
  });

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
      id: json['id'] as String?,
      name: json['name'] as String?,
      index: json['index'] as int?,
      userDraws: (json['userDraws'] as List?)
          ?.map((e) => UserDraw.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class UserDraw {
  final String? id;
  final String? playerOneId;
  final String? playerOneFirstName;
  final String? playerOneLastName;
  final String? playerOneClub;
  final String? playerOneFlag;
  final int? playerOneRank;
  final String? playerTwoId;
  final String? playerTwoFirstName;
  final String? playerTwoLastName;
  final String? playerTwoClub;
  final String? playerTwoFlag;
  final int? playerTwoRank;
  final bool? isByePlayerOne;
  final bool? isByePlayerTwo;
  final String? set1;
  final String? set2;
  final String? set3;
  final String? tieBreaks;
  final String? status;
  final String? winnerId;
  final String? winnerFriendId;

  UserDraw({
    required this.id,
    required this.playerOneId,
    required this.playerOneFirstName,
    required this.playerOneLastName,
    required this.playerOneClub,
    required this.playerOneFlag,
    required this.playerOneRank,
    required this.playerTwoId,
    required this.playerTwoFirstName,
    required this.playerTwoLastName,
    required this.playerTwoClub,
    required this.playerTwoFlag,
    required this.playerTwoRank,
    required this.isByePlayerOne,
    required this.isByePlayerTwo,
    required this.set1,
    required this.set2,
    required this.set3,
    required this.tieBreaks,
    required this.status,
    required this.winnerId,
    required this.winnerFriendId,
  });

  factory UserDraw.fromJson(Map<String, dynamic> json) {
    return UserDraw(
      id: json['id'] as String?,
      playerOneId: json['playerOneId'] as String?,
      playerOneFirstName: json['playerOneFirstName'] as String?,
      playerOneLastName: json['playerOneLastName'] as String?,
      playerOneClub: json['playerOneClub'] as String?,
      playerOneFlag: json['playerOneFlag'] as String?,
      playerOneRank: json['playerOneRank'] as int?,
      playerTwoId: json['playerTwoId'] as String?,
      playerTwoFirstName: json['playerTwoFirstName'] as String?,
      playerTwoLastName: json['playerTwoLastName'] as String?,
      playerTwoClub: json['playerTwoClub'] as String?,
      playerTwoFlag: json['playerTwoFlag'] as String?,
      playerTwoRank: json['playerTwoRank'] as int?,
      isByePlayerOne: json['isByePlayerOne'] as bool?,
      isByePlayerTwo: json['isByePlayerTwo'] as bool?,
      set1: json['set1'] as String?,
      set2: json['set2'] as String?,
      set3: json['set3'] as String?,
      tieBreaks: json['tieBreaks'] as String?,
      status: json['status'] as String?,
      winnerId: json['winnerId'] as String?,
      winnerFriendId: json['winnerFriendId'] as String?,
    );
  }
}
