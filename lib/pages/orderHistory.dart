import 'package:FoodDeli/values/app_colors.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            tabs: const [
              Tab(text: 'Tất cả'),
              Tab(text: 'Đang giao'),
              Tab(text: 'Đã đặt'),
              Tab(text: 'Đã hủy'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOrderList(),
                _buildOrderList(),
                _buildOrderList(),
                _buildOrderList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList() {
    return ListView.builder(
      itemCount: 10, // Replace with your actual item count
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://example.com/image.jpg'),
            ),
            title: const Text(
              'Tên món ăn',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: #123456',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Số lượng: 2',
                ),
                Text(
                    // NumberFormat('#,##0').format(),
                    'Giá tiền: 200,000đ'
                ),
                Text('Trạng thái: Đang giao'),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nút được nhấn
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: const Text(
                    "Đặt lại",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
