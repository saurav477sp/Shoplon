import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/DotsV.svg",
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
            )
          ],
        ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return ListTile(
              leading: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: notification.color,
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(
                notification.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400, // Lighter font weight
                    ),
              ),
              subtitle: Text(
                notification.time,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
            );
          },
        ),
      ),
    );
  }
}

class Notification {
  final String title;
  final String time;
  final Color color;

  Notification({
    required this.title,
    required this.time,
    required this.color,
  });
}

final List<Notification> notifications = [
  Notification(
    title: 'Molestie libero neque sem cras enim, amet.',
    time: '2 min ago',
    color: Colors.red.shade400,
  ),
  Notification(
    title: 'Egestas nisl sapien amet lectus molestie id euismod.',
    time: '6 hours ago',
    color: Colors.blue.shade400,
  ),
  Notification(
    title: 'Ullamcorper ac ornare ipsum ut sed integer turpis felis viverra...',
    time: '4 days ago',
    color: Colors.green.shade400,
  ),
  Notification(
    title: 'Facilisis in proin ultrices in tincidunt adipiscing turpis praesent non.',
    time: '5 day ago',
    color: Colors.orange.shade400,
  ),
  Notification(
    title: 'Pellentesque proin risus pellentesque odio a.',
    time: '1 week ago',
    color: Colors.purple.shade400,
  ),
  Notification(
    title: 'Enim, proin ac ut nullam nec.',
    time: '1 week ago',
    color: Colors.teal.shade400,
  ),
  Notification(
    title: 'Molestie libero neque sem cras enim, amet.',
    time: '1 week ago',
    color: Colors.pink.shade400,
  ),
];