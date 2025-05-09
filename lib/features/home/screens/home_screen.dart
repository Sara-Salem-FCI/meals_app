import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/utils/colors.dart';
import 'package:meals_app/features/home/data/db_helper/db_helper.dart';
import 'package:meals_app/features/home/screens/add_meal_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    createDatabase().then((value) => fetchMeals());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage('assets/images/home_img.png'),
                fit: BoxFit.cover,
              ),
              Container(
                height: 170.h,
                width: 180.w,
                margin: EdgeInsets.only(top: 50.h, left: 30.w),
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Welcome\nAdd A New\nRecipe',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Your Food',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              physics: const BouncingScrollPhysics(),
              itemCount: meals.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 120.h,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: NetworkImage(meals[index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            meals[index]['name'],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: 20.sp,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                meals[index]['rate'],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.access_time_filled,
                                color: AppColors.orange,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                meals[index]['time'],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: AppColors.white,
        shape: const CircleBorder(
          side: BorderSide(color: AppColors.orange, width: 5),
        ),
        child: const Icon(Icons.add, color: AppColors.orange, size: 60),
        onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddMealScreen()),
            );

            if (result == true) {
              await fetchMeals();
            }
        },
      ),
    );
  }
  Future<void> fetchMeals() async {
    if (database != null) {
      final data = await getDataFromDatabase(database);
      setState(() {
        meals = data;
      });
    }
  }

}
