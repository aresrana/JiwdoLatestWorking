class Videos {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Videos({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.channelTitle,
  });

  factory Videos.fromMap(Map<String, dynamic> snippet) {
    return Videos(
      id: snippet['resourceId']['videoId'],
      title: snippet['title'],
      thumbnailUrl: snippet['thumbnails']['high']['url'],
      channelTitle: snippet['channelTitle'],
    );
  }
}