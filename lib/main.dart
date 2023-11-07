import 'package:Project/lib/models/material.dart'
import 'package:Project/lib/screens/home_screen.dart'
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {

  @overide
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: False,
      theme: ThemeData(
        scaffoldBackGroundColor: Color.grey[50],
        primaryColor: Colors.deepOrangeAccent,
      ),
      Home: HomeScreen(),
    );
  }
}
