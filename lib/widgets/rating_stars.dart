class RatingStars extends StatelessWidget {

  final int rating;

  RatingStairs(this.rating);
  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i=0; i< rating; i++){
      stars += '⭐  ';
    }
    stars.strim();
    return Text(
      stars, 
      style: TextStyle(
        fontSize: 18.0,
    ),//TextStyle
    );//Text
  }
}