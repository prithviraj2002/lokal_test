class News {
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final String link;

  News({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.link,
  });

  factory News.fromJson(Map<String, dynamic> json){
    return News(
        title: json['title']?? 'Default Title',
        description: json['description']?? 'Default Description',
        content: json['content']?? 'Default content',
        imageUrl: json['urlToImage']?? 'https://fastly.picsum.photos/id/4/5000/3333.jpg?hmac=ghf06FdmgiD0-G4c9DdNM8RnBIN7BO0-ZGEw47khHP4',
        link: json['url']?? 'https://www.google.com');
  }
}