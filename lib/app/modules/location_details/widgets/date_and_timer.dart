import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weblabstask/app/modules/location_details/view_model/datails_provider.dart';

import '../../../utils/common_widgets.dart';

class DateAndTimer extends StatefulWidget {
  const DateAndTimer({super.key});

  @override
  _DateAndTimerState createState() => _DateAndTimerState();
}

class _DateAndTimerState extends State<DateAndTimer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const CommonTextWidget(
          text: "Select Booking Date",
          color: Color(0xff666666),
          fontSize: 16,
          align: TextAlign.left,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8.0),
        Consumer<DetailsProvider>(builder: (context, obj, _) {
          return ComonTextfieldWidgets(
            onTap: () async => await obj.selectDate(context),
            controller: obj.dateController,
            suffixIcon: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFF0891B2), // #0891B2
                  Color(0xFF18C8F2), // #18C8F2
                  Color(0xFF97EBFF), // #97EBFF
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds),
              child: const Icon(
                Icons.calendar_today,
                color: Colors.white, // This color won't be used, since ShaderMask will apply the gradient
              ),
            ),
          );
        }),
        const SizedBox(height: 16.0),
        const CommonTextWidget(
          text: "Select Booking Time",
          color: Color(0xff666666),
          fontSize: 16,
          align: TextAlign.left,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 8.0),
        Consumer<DetailsProvider>(builder: (context, obj, _) {
          return ComonTextfieldWidgets(
            controller: obj.timeController,
            suffixIcon: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFF0891B2), // #0891B2
                  Color(0xFF18C8F2), // #18C8F2
                  Color(0xFF97EBFF), // #97EBFF
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds),
              child: const Icon(
                Icons.access_time,
                color: Colors.white, // This color won't be used, since ShaderMask will apply the gradient
              ),
            ),
            onTap: () async => await _selectTime(context),
          );
        }),
      ],
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final timeProvider = context.read<DetailsProvider>();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeProvider.selectedTime,
    );
    if (picked != null) {
      timeProvider.updateSelectedTime(picked);
      context.read<DetailsProvider>().timeController.text = picked.format(context); // Update the TextField
    }
  }
}
