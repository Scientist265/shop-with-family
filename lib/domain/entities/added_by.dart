enum AddedBy { host, friend }

extension AddedByExtension on AddedBy {
  String get name => switch (this) {
    AddedBy.host => 'Host',
    AddedBy.friend => 'Friend',
  };
}
