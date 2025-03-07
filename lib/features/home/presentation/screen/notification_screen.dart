import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:machine_task/features/home/data/api.dart';
import 'package:machine_task/features/home/data/connection_service.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    Provider.of<ConnectionNotifier>(context, listen: false)
        .checkConnectionAndFetchNotifications(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          title: Text(
            'Notification',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Consumer<ConnectionNotifier>(
        builder: (context, connectionNotifier, child) {
          if (!connectionNotifier.isConnected) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We're having trouble connecting.Please",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "  check your internet connectivity!.  ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return FutureBuilder(
            future:
                Provider.of<NoficationImplementantion>(context, listen: false)
                    .fetchNotifications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.green),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Consumer<NoficationImplementantion>(
                  builder: (context, notificationProvider, child) {
                    final notifications = notificationProvider.datas;
                    if (notifications.isEmpty) {
                      return const Center(
                        child: Text(
                          'No notifications available',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      );
                    }
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          final item = notifications[index];
                          return Container(
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    getImage(item.image.toString()),
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title.toString(),
                                        overflow: TextOverflow.visible,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        item.body.toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        timeAgo(item.timestamp.toString()),
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemCount: notifications.length);
                  },
                );
              }
            },
          );
        },
      ),
    );
  }

  String getImage(String image) {
    log("Image string received: $image");
    int dotIndex = image.indexOf('.');
    if (dotIndex == -1) {
      log("Invalid image name format: $image");
      return "";
    }

    String name = image.substring(0, dotIndex);
    switch (name) {
      case 'order_assigned':
        return 'assets/images/order_assigned.png';
      case "order_cancelled":
        return 'assets/images/order_cancelled.png';
      case "order_delivered":
        return 'assets/images/order_delivered.png';
      case 'out-of-stock':
        return 'assets/images/out-of-stock 1.png';
      case "promotion_marketplace":
        return "assets/images/promotion_marketplace.png";
      case "promotion_notify":
        return "assets/images/promotion_nootify.png";
      case "support_personnel":
        return "assets/images/support_peersonnel.png";
      default:
        return "null";
    }
  }

  String timeAgo(String timestamp) {
    // Parse the timestamp string into a DateTime object
    DateTime notificationTime = DateTime.parse(timestamp);
    DateTime now = DateTime.now();

    Duration difference = now.difference(notificationTime);

    if (difference.inDays > 365) {
      int years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      int months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}
