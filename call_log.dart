import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart'; 

// VoiceMessageCard(),
// FeedbackMessageCard(
//   title: "To check client’s feedback",
//   dateTime: "20/10/2025 - 12:00 am",
//   message:
//       "I wanted to follow up to see if you had a chance to review our proposal and share your thoughts...",
// ),

class VoiceMessageCard extends StatelessWidget {
  const VoiceMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFD3E4E8), // background color (light teal-blue)
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Left section: date & message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "21/02/2025 10:32 am",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "“Just wanted to confirm if you received my previous email regarding ...”",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
      
            const SizedBox(width: 10),
      
            // Right section: play icon and red rec dot
            Stack(
              alignment: Alignment.center,
              children: [
                // Play button circle
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFE1EFF9),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.blueAccent,
                    size: 28,
                  ),
                ),
      
                // Red dot positioned bottom right
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class FeedbackMessageCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String message;

  const FeedbackMessageCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //   color: const Color(0xFFD3E4E8), // Light blue background
      //   borderRadius: BorderRadius.circular(12),
      // ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vertical black bar
            Container(
              width: 6,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 12),
      
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF001A8C), // Dark blue
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Date and time
                  Text(
                    dateTime,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Message text
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====

class CustomAppDrawer extends StatelessWidget {
  final String selectedItem;

  const CustomAppDrawer({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Dark blue background
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User info section
              Row(
                children: [
                   CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.blue.withAlpha(150
                    ),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ashu",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Software Engineer",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Browse section
              const Text(
                "Main menu",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),

              _buildMenuItem(
                
                icon: Icons.home,
                title: "Whas",
                selected: selectedItem == "Home",
              ),
              _buildMenuItem(
                icon: Icons.search,
                title: "Search",
                selected: selectedItem == "Search",
              ),
              _buildMenuItem(
                icon: Icons.star,
                title: "Favorites",
                selected: selectedItem == "Favorites",
              ),
              _buildMenuItem(
                icon: Icons.message,
                title: "Help",
                selected: selectedItem == "Help",
              ),

              // const SizedBox(height: 10),
              Divider( thickness: 1,),
              // const SizedBox(height: 10),

              // History section
              const Text(
                "Settings",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),

              _buildMenuItem(
                icon: Icons.timelapse_sharp,
                title: "History",
                selected: selectedItem == "History",
              ),
              _buildMenuItem(
                icon: Icons.sports_baseball_rounded,
                title: "Notification",
                selected: selectedItem == "Notification",
              ),

              const Spacer(),

              // Dark Mode toggle
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //      Row(
              //       children: [
              //         Icon(Icons.light_mode, color: Colors.blue.withAlpha(200)),
              //         SizedBox(width: 10),
              //         Text(
              //           "Dark Mode",
              //           style: TextStyle(color: Colors.blue),
              //         ),
              //       ],
              //     ),
              //     Switch(
              //       value: false,
              //       onChanged: (val) {},
              //       activeColor: Colors.blueAccent,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // Drawer menu item widget
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    bool selected = false,
    void Function()? onTap,

  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: selected ? Colors.blueAccent.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? Colors.blueAccent : Colors.blue,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.blueAccent : Colors.black,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
