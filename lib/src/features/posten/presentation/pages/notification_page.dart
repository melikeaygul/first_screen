import 'package:first_screen/src/features/notification/domain/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationItem> notifications = [
      NotificationItem(
        username: 'laura.stern',
        message: 'gefällt dein look.',
        timestamp: 'vor 2 Minuten',
      ),
      NotificationItem(
        username: 'tina_halle',
        message: 'folgt dir jetzt.',
        timestamp: 'vor 5 Minuten',
      ),
      NotificationItem(
        username: 'sarah_polsk',
        message: 'hat einen Kommentar hinterlassen.',
        timestamp: 'vor 10 Minuten',
      ),
      NotificationItem(
        username: 'jenny_pohl',
        message: 'gefällt dein look.',
        timestamp: 'vor 10 Minuten',
      ),
      NotificationItem(
        username: 'paula.ohlsen',
        message: 'hat einen Kommentar hinterlassen.',
        timestamp: 'vor 10 Minuten',
      ),
      NotificationItem(
        username: 'cleopoel',
        message: 'gefällt dein look.',
        timestamp: 'vor 10 Minuten',
      ),
      NotificationItem(
        username: 'lena.karl',
        message: 'hat einen Kommentar hinterlassen.',
        timestamp: 'vor 10 Minuten',
      ),
      NotificationItem(
        username: 'annalaurent7',
        message: 'folgt dir jetzt.',
        timestamp: 'vor 10 Minuten',
      ),
      NotificationItem(
        username: 'demi.kohl',
        message: 'folgt dir jetzt.',
        timestamp: 'vor 10 Minuten',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16),

      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: notification.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' ${notification.message}'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notification.timestamp,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
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
    );
  }
}
