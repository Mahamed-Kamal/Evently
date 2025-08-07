import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/utils/validation_utils.dart';
import 'package:evently/data/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../create_event_provider.dart';
import '../../../../core/firebase/firebase_manager.dart';
import '../../../../core/route_manager/routes.dart';
import '../../../../core/utils/data_time_utils.dart';
import '../widgets/category_event_item.dart';
import '../widgets/choose_item.dart';
import '../widgets/event_text_form_field.dart';
import '../widgets/event_image_widget.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {

  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  DateTime? selectedDate;
  bool isValidDate = true;
  DateTime? selectedTime;
  bool isValidTime = true;
  var formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "create_event".tr(),
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 12.h,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      EventImageWidget(image: provider.eventCategories[provider
                          .selectedCategory].imagePath),
                      SizedBox(
                        height: 50.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              InkWell(
                                onTap: () => provider.changeCategory(index),
                                child: CategoryEventItem(
                                  eventCategoryModel: provider
                                      .eventCategories[index],
                                  isSelected: provider.selectedCategory ==
                                      index,
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 12.w),
                          itemCount: provider.eventCategories.length,
                        ),
                      ),
                      Text(
                        "title".tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      EventTextFormField(
                        labelText: "event_title".tr(),
                        isIcon: true,
                        controller: titleController,
                        validator: ValidationUtils.isValidTitle,
                      ),
                      Text(
                        "description".tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      EventTextFormField(
                        labelText: "event_description".tr(),
                        maxLines: 5,
                        controller: descriptionController,
                        validator: ValidationUtils.isValidDescription,
                      ),
                      // const EventDateAndChooseDate(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChooseItem(
                            hintText: "event_date".tr(),
                            icon: Icons.date_range,
                            textButton: selectedDate == null ? "choose_date"
                                .tr() : formatDate(selectedDate!),
                            onTap: showDate,
                          ),
                          if (isValidDate == false)
                            Text(
                              "please_choose_date".tr(),
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall!.copyWith(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChooseItem(
                            hintText: "event_time".tr(),
                            icon: Icons.access_time,
                            textButton:
                                selectedTime == null
                                    ? "choose_time".tr()
                                    : formatTime(selectedTime!),
                            onTap: showTime,
                          ),
                          if (isValidTime == false)
                            Text(
                              "please_choose_time".tr(),
                              style: Theme.of(
                                context,
                              ).textTheme.labelSmall!.copyWith(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                        ],
                      ),

                      ElevatedButton(
                        onPressed: () {
                          addEventValid(provider);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.mainLayout,
                            (route) => false,
                          );
                        },
                        child: Text(
                          "add_event".tr(),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void addEventValid(CreateEventProvider provider) async {
    setState(() {
      isValidDate = selectedDate != null;
      isValidTime = selectedTime != null;
    });
    if (formKey.currentState?.validate() == false ||
        !isValidDate && !isValidTime) {
      return;
    }
    TaskModel task = TaskModel(
      title: titleController.text,
      description: descriptionController.text,
      userId: FirebaseAuth.instance.currentUser!.uid,
      date: selectedDate!.millisecondsSinceEpoch,
      time: selectedTime!.millisecondsSinceEpoch,
      category: provider.eventCategories[provider.selectedCategory].name,
      lat: null,
      long: null,
    );
    await FirebaseManager.addTask(task);
  }

  showDate() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    setState(() {
      selectedDate = chosenDate;
      isValidDate = chosenDate != null;
    });
  }

  showTime() async {
    var now = TimeOfDay(
      hour: DateTime.now().hour,
      minute: DateTime.now().minute,
    );
    var chosenTime = await showTimePicker(
      context: context,
      initialTime:
          selectedTime == null
              ? now
              : TimeOfDay(hour: selectedTime!.hour, minute: selectedTime!.hour),
    );
    setState(() {
      if (chosenTime == null) {
        selectedTime = null;
        isValidTime = false;
        return;
      }
      selectedTime = DateTime(0, 0, 0, chosenTime.hour, chosenTime.minute);
      isValidTime = true;
    });
  }
}
