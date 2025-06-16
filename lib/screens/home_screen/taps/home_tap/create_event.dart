import 'package:easy_localization/easy_localization.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/models/task_model.dart';
import 'package:evently/screens/home_screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../App Utils/data_time_utils.dart';
import '../../../../../providers/create_event_provider.dart';
import '../../../../widgets/category_event_item.dart';
import '../../../../widgets/choose_item.dart';
import '../../../../widgets/event_text_form_field.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = "Create-Event-Screen";

  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  DateTime? selectedDate;
  DateTime? selectedTime;
  bool isValidDate = true;
  bool isValidTime = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double sizeHeight = MediaQuery.of(context).size.height;
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
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: Image.asset(
                          provider
                              .eventCategories[provider.selectedCategory]
                              .imagePath,
                          height: sizeHeight * 0.26,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: sizeHeight * 0.06,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder:
                              (context, index) => InkWell(
                                onTap: () {
                                  provider.changeCategory(index);
                                },
                                child: CategoryEventItem(
                                  eventCategoryModel:
                                      provider.eventCategories[index],
                                  isSelected:
                                      provider.selectedCategory == index,
                                ),
                              ),
                          separatorBuilder:
                              (context, index) => SizedBox(width: 12),
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
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please_enter_event_title".tr();
                          }
                          return null;
                        },
                      ),
                      Text(
                        "description".tr(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      EventTextFormField(
                        labelText: "event_description".tr(),
                        maxLines: 5,
                        controller: descriptionController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please_enter_event_description".tr();
                          }
                          return null;
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ChooseItem(
                            hintText: "event_date".tr(),
                            icon: Icons.date_range,
                            textButton:
                                selectedDate == null
                                    ? "choose_date".tr()
                                    : formatDate(selectedDate!),
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
                            HomeScreen.routeName,
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
