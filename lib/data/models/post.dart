class Post {
  static Map post;
  Post(Map data) {
    post = data;
  }
  static int getID() => post['id'];
  static String getTitle() => post['title'];
  static String getBody() => post['body'];
}
