class NewsModel {
  int? id;
  String? date;
  String? slug;
  String? title;
  String? content;
  String? excerpt;
  String? image;

  NewsModel({
    this.id,
    this.date,
    this.slug,
    this.title,
    this.content,
    this.excerpt,
    this.image,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    slug = json['slug'];
    title = json['title']['rendered'];
    content = json['content']['rendered'];
    excerpt = json['excerpt']['rendered'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['slug'] = slug;
    data['title'] = title;
    data['content'] = content;
    data['excerpt'] = excerpt;
    data['image'] = image;
    return data;
  }
}
