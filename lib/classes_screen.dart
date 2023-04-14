import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/addition_screen.dart';

class classesScreen extends StatefulWidget {
  const classesScreen({Key? key}) : super(key: key);

  @override
  State<classesScreen> createState() => _classesScreenState();
}

class _classesScreenState extends State<classesScreen> {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xffffffff),
        child: const Image(
          image: AssetImage(
              'Assets/images/add.png'
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: (){},
                                color: const Color(0xff000000),
                                iconSize: 32,
                                icon: const Icon(
                                  Icons.menu_rounded,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Correct',
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  fontFamily: 'poppins',
                                ),
                              ),

                              const SizedBox(
                                width: 5.0,
                              ),

                              const Text(
                                '4',
                                style: TextStyle(
                                  color: Color(0xff61BDEE),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  fontFamily: 'poppins',
                                ),
                              ),

                              const Spacer(),

                              IconButton(
                                onPressed: (){},
                                iconSize: 45,
                                icon: const CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Color(0xff4E4E4E),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 35,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              children: [
                                const Text(
                                  'your',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins'
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'classes',
                                  style: TextStyle(
                                      color: Color(0xff61BDEE),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Poppins-Bold'
                                  ),
                                ),

                                const Spacer(),

                                Center(
                                  child: IconButton(
                                      onPressed: (){},
                                      icon: const Icon(
                                        Icons.search_rounded,
                                        size: 30,
                                        color: Color(0xff61BDEE),
                                      ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const SizedBox(height: 20) ,
                            itemBuilder: (context, index) => const MainCard(),
                            itemCount: 5,
                            scrollDirection: Axis.vertical,
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          // FloatingActionButton(
                          //   onPressed: () {},
                          //   child: Image(
                          //     image: AssetImage(
                          //         'Assets/images/add.png'
                          //     ),
                          //   ),
                          //   backgroundColor: Color(0xffffffff),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child:   Container(
          height: 210,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius:BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(
              color: const Color(0xff61BDEE),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdditionScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 82,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: const Color(0xff61BDEE),
                    border: Border.all(
                      width: 0,
                      color: const Color(0xff61BDEE),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children:  [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'FCDS - level 3',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),

                              Spacer(),


                              Text(
                                'Simu',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),
                        ),
                        const Spacer(),

                        IconButton(
                          onPressed: (){},
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: const Text(
                                'Excel Sheet',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff424242),
                                ),
                              ),
                            ),
                            const Spacer(),

                            IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                Icons.ios_share,
                                color: Color(0xff61BDEE),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: const Text(
                                'Add Model Answer',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff424242),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: (){},
                              child: const Text(
                                'Add Buble Sheet',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff424242),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


