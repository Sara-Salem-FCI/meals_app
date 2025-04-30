import 'package:flutter/material.dart';
import 'package:meals_app/features/home/screens/widgets/custom_text_form_field.dart';
import '../../../core/utils/colors.dart';
import '../data/db_helper/db_helper.dart';
import '../data/models/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Add Meal',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      label: 'Meal Name',
                    ),
                    CustomTextFormField(
                      controller: imageUrlController,
                      label: 'Image Url',
                      maxLines: 3,
                    ),
                    CustomTextFormField(
                      controller: rateController,
                      label: 'Rate',
                    ),
                    CustomTextFormField(
                      controller: timeController,
                      label: 'Time',
                    ),
                    CustomTextFormField(
                      controller: descriptionController,
                      label: 'Description',
                      maxLines: 3,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        insertIntoDatabase(
                          meal: MealModel(
                            title: nameController.text,
                            img: imageUrlController.text,
                            rate: rateController.text,
                            time: timeController.text,
                            description: descriptionController.text,
                          ),
                        ).then((value) {
                          Navigator.pop(context, true);
                        });
                      }
                    },
                    shape: const StadiumBorder(),
                    color: AppColors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
