import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/common_widgets.dart';
import '../../../utils/size_box.dart';
import '../../location/widgets/common_button.dart';
import '../view_model/datails_provider.dart';
import '../widgets/date_and_timer.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Consumer<DetailsProvider>(builder: (context, obj, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add a divider or header for the bottom sheet
              const SizeBoxH(20),
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Row(
                children: [
                  CommonTextWidget(
                    color: Colors.black,
                    text: "Book For",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    align: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 5, 1, 0.03),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: obj.isbooklater
                    ? Column(
                        children: [
                          const CommonTextWidget(
                            color: Colors.black,
                            text: "Available Balance",
                            fontSize: 14,
                            align: TextAlign.left,
                            fontWeight: FontWeight.w400,
                          ),
                          const CommonTextWidget(
                            color: Colors.black,
                            text: "₹100.00",
                            fontSize: 30,
                            align: TextAlign.center,
                            fontWeight: FontWeight.w900,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: const Color(0xffF5F5F5),
                                  child: ShaderMask(
                                    shaderCallback: (bounds) => const LinearGradient(
                                      colors: [
                                        Color(0xFF0891B2), // #0891B2
                                        Color(0xFF18C8F2), // #18C8F2
                                        Color(0xFF97EBFF), // #97EBFF
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ).createShader(bounds),
                                    child: const Icon(Icons.add,
                                        size: 16,
                                        color: Colors
                                            .white // This color won't be used, since ShaderMask will apply the gradient
                                        ),
                                  ),
                                ), // Icon color
                                label: ShaderMask(
                                  shaderCallback: (bounds) {
                                    return const LinearGradient(
                                      colors: [
                                        Color(0xFF0891B2), // #0891B2
                                        Color(0xFF18C8F2), // #18C8F2
                                        Color(0xFF97EBFF), // #97EBFF
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      stops: [0.0, 0.6787, 1.3575],
                                    ).createShader(bounds);
                                  },
                                  child: const CommonTextWidget(
                                    text: 'Add Money',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white, // Make button background transparent
                                  shadowColor: Colors.white, // Remove shadow to match gradient
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40), // Rounded corners
                                  ),
                                ),
                                // Wrap the button with a gradient container
                              ),
                            ],
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color.fromRGBO(235, 235, 235, 1.0),
                                child: Icon(Icons.priority_high),
                              ),
                              SizeBoxV(8),
                              Expanded(
                                child: CommonTextWidget(
                                  color: Colors.black,
                                  text:
                                      "Your call will end in 2 minutes due to low wallet balance. Available Balance : ₹100",
                                  fontSize: 14,
                                  align: TextAlign.left,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizeBoxH(19),
                          const CommonTextWidget(
                            color: Color.fromRGBO(139, 139, 139, 1),
                            text: "Add money to continue the call.",
                            fontSize: 14,
                            align: TextAlign.left,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Color.fromRGBO(22, 165, 198, 0.1),
                                child: Icon(Icons.add, size: 16)),
                            label: const CommonTextWidget(
                              text: 'Add Money',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              const SizeBoxH(30),
              const Row(
                children: [
                  CommonTextWidget(
                    color: Color(0xff666666),
                    text: 'Requested Info',
                    fontSize: 16,
                    align: TextAlign.left,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizeBoxH(8),
              // TextField for Input
              DropdownTextFormField(
                hintText: "Select Your Interest*",
                items: const ["Interest 1", "Interest 2", "Interest 3"],
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  CommonTextWidget(
                    text: 'Write request (Optional)',
                    color: Color(0xff666666),
                    fontSize: 16,
                    align: TextAlign.left,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const SizeBoxH(8),
              const ComonTextfieldWidgets(
                hintText: "Write request (Optional)",
              ),
              const SizedBox(height: 20),

              // Buttons in a Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      obj.isbooklaterFnc(value: false);
                    },
                    child: Container(
                      decoration: obj.isbooklater
                          ? BoxDecoration(
                              color: Colors.white, // Background color of the container
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(
                                      0x330A0E0F), // Color from hex code #0A0E0F33, using the opacity (33 in hex = 0.2 opacity)
                                  offset: Offset(0, 1), // x: 0px, y: 1px (vertical offset)
                                  blurRadius: 4, // Blur radius: 4px
                                  spreadRadius: 0, // Spread radius: 0px
                                ),
                              ],
                              //
                            )
                          : BoxDecoration(
                              color: Colors.green[100], // Background color of the container
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                              //
                            ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 35,
                      ),
                      child: Column(
                        children: [
                          Image.asset('assets/images/book now.png'),
                          const CommonTextWidget(
                            color: Colors.black,
                            text: "Book Now",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      obj.isbooklaterFnc(value: true);
                    },
                    child: Container(
                      decoration: obj.isbooklater == true
                          ? BoxDecoration(
                              color: Colors.green[100], // Background color of the container
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                              //
                            )
                          : BoxDecoration(
                              color: Colors.white, // Background color of the container
                              borderRadius: BorderRadius.circular(10), // Rounded corners
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(
                                      0x330A0E0F), // Color from hex code #0A0E0F33, using the opacity (33 in hex = 0.2 opacity)
                                  offset: Offset(0, 1), // x: 0px, y: 1px (vertical offset)
                                  blurRadius: 4, // Blur radius: 4px
                                  spreadRadius: 0, // Spread radius: 0px
                                ),
                              ],
                              //
                            ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 35,
                      ),
                      child: Column(
                        children: [
                          Image.asset('assets/images/book later.png'),
                          const CommonTextWidget(
                            color: Colors.black,
                            text: "Book Later",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              obj.isbooklater ? const DateAndTimer() : const SizedBox.shrink(),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0x1C0891B2), // rgba(8, 145, 178, 0.1)
                      Color(0x1B18C8F2), // rgba(24, 200, 242, 0.1)
                      Color(0x19A1EBFF), // rgba(151, 235, 255, 0.1)
                    ],
                    stops: [0.0, 0.6787, 1.0], // Matches the CSS percentages: 0%, 67.87%, 135.75%
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    CommonTextWidget(
                      color: Color(0xfff000405),
                      text: "20 lb CO2eq",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      align: TextAlign.center,
                      height: 18,
                    ),
                    CommonTextWidget(
                      color: Color(0xfff000405),
                      text: "GHG Savings with this request",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      align: TextAlign.center,
                      height: 18,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration:
                    BoxDecoration(color: const Color.fromRGBO(0, 5, 1, 0.03), borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(
                        0xffEBEBEB,
                      ),
                      child: Icon(
                        Icons.error_outline,
                        color: Color(0xff666666),
                      ),
                    ),
                    SizeBoxV(10),
                    Expanded(
                      child: CommonTextWidget(
                        color: Color(0xff666666),
                        text: 'Enjoy service at just ₹100 per minute.',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        overFlow: TextOverflow.clip,
                        align: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // // Send Request Button
              CommonButton(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false, // Prevent dialog dismissal by tapping outside
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // Rounded corners
                        ),
                        contentPadding: const EdgeInsets.all(24),
                        content: Column(
                          mainAxisSize: MainAxisSize.min, // Shrink to fit content
                          children: [
                            // Sad face icon
                            Image.asset('assets/images/icon-location.png'),
                            const SizedBox(height: 16), // Space between icon and text

                            // Title text using CommonTextWidget
                            const CommonTextWidget(
                              text: "Temporary Unavailability of Wybers",
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              align: TextAlign.center,
                            ),
                            const SizedBox(height: 8), // Space between title and subtitle

                            // Subtitle text using CommonTextWidget
                            const CommonTextWidget(
                              text: "No Wybers are currently available. Please check back in a few minutes.",
                              color: Colors.black54,
                              fontSize: 14,
                              letterSpacing: 0.3,
                              align: TextAlign.center,
                            ),
                            const SizedBox(height: 24), // Space before button

                            // Done button
                            const CommonButton(
                              text: 'Done',
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                text: 'Send Request',
              ),
              const SizedBox(height: 24), // Space before button
            ],
          );
        }),
      ),
    );
  }
}

// DropdownTextFormField Class
class DropdownTextFormField extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final void Function(String?)? onChanged;

  const DropdownTextFormField({
    super.key,
    required this.hintText,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          border: Border.all(
            width: 1,
            color: const Color(0xffCFD1D1),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F000000), // #0000001F in RGBA format
              offset: Offset(0, 1), // 0px horizontal, 1px vertical offset
              blurRadius: 4, // 4px blur radius
              spreadRadius: 0, // 0px spread radius
            ),
          ],
        ),
        child: Center(
          child: DropdownButtonFormField<String>(
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: AlignmentDirectional.centerStart,
            dropdownColor: const Color(0xffFFFFFF),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
              border: InputBorder.none, // Set to InputBorder.none
              enabledBorder: InputBorder.none, // Set to InputBorder.none
              contentPadding: const EdgeInsets.symmetric(horizontal: 12), // Adjust padding for centering
              alignLabelWithHint: true, // Align the hint text
            ),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: onChanged,
            icon: ShaderMask(
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
                Icons.keyboard_arrow_down,
                color: Colors.white, // This color won't be used, since ShaderMask will apply the gradient
              ),
            ),
          ),
        ));
  }
}

extension GradientWrapper on Widget {
  Widget wrapWithGradientBackground({
    required Gradient gradient,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: this, // Apply gradient to the widget
      ),
    );
  }
}
