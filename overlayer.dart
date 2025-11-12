import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FollowUpPopup extends StatefulWidget {
  const FollowUpPopup({super.key});

  @override
  State<FollowUpPopup> createState() => _FollowUpPopupState();
}

class _FollowUpPopupState extends State<FollowUpPopup> {
  final TextEditingController callSummaryController = TextEditingController();
  final TextEditingController followupReasonController =
      TextEditingController();

  String? selectedStatus = "Capsule";
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  final List<String> statuses = [
    "Capsule",
    "Interested",
    "Not Interested",
    "Callback",
  ];

  Future<void> pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blue.shade50,
                  child: const Text(
                    "R",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ravi", style: Get.theme.textTheme.bodyMedium),
                      Text(
                        "Madurai, Tamil Nadu",
                        style: Get.theme.textTheme.bodySmall?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "VIP",
                              style: Get.theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.add, size: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    _circleIcon(Icons.sms_failed_sharp, Colors.blue.shade50),
                    const SizedBox(width: 8),
                    _circleIcon(Icons.call, Colors.blue.shade50),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text(
              "Call Summary",
              style: Get.theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            _textBox(
              controller: callSummaryController,
              hint: "Enter call summary",
            ),

            const SizedBox(height: 8),
            Text(
              "Followup info:",
              style: Get.theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Followup eiubbnnnionbiubjiikjknk",
              style: Get.theme.textTheme.bodySmall?.copyWith(),
            ),

            const SizedBox(height: 8),
            Text(
              "Followup Status",
              style: Get.theme.textTheme.bodyMedium?.copyWith(
           fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 3),
            DropdownButtonFormField<String>(
              initialValue: selectedStatus,
              decoration: _inputDecoration(),
              padding: EdgeInsets.symmetric(vertical: 0),
              items:
                  statuses.map((status) {
                    return DropdownMenuItem(value: status, child: Text(status));
                  }).toList(),
              onChanged: (value) => setState(() => selectedStatus = value),
            ),
            const SizedBox(height: 8),
             Text(
              "Next Followp",
              style: Get.theme.textTheme.bodyMedium?.copyWith( color: Colors.black87),
            ),
            const SizedBox(height: 3),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: pickTime,
                    child: _readonlyBox(
                      selectedTime != null
                          ? selectedTime!.format(context)
                          : "12:00",
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: pickDate,
                    child: _readonlyBox(
                      selectedDate != null
                          ? DateFormat("dd-MM-yyyy").format(selectedDate!)
                          : "11-11-2025",
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Text(
              "Followup Reason",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _textBox(
              controller: followupReasonController,
              hint: "Enter reason",
            ),

            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Get.theme.primaryColor,
                    // textStyle: TextStyle(
                    //   color: Colors.white
                    // ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Saved",
                    style: Get.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon, Color bg) {
    return CircleAvatar(
      backgroundColor: bg,
      radius: 20,
      child: Icon(icon, color: Colors.black87, size: 20),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical:2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }

  Widget _readonlyBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        // color: Colors.grey.shade50,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _textBox({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      maxLines: 3,

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Get.theme.textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: const BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
