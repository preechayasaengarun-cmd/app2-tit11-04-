import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // กำหนดธีมสีของแอปพลิเคชันโดยใช้ ColorScheme จากสีตั้งต้น (indigo)
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar: แถบด้านบนของหน้าจอ สำหรับแสดง ไอดีแอคเคาท์ และ ไอคอนเมนู
      appBar: AppBar(
        title: const Text(
          'ปรีชญา แสงอรุณ', // ชื่อ-ไอดีแอคเคาท์
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          // ไอคอนเมนูด้านขวาของ AppBar
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      // SingleChildScrollView: ช่วยให้หน้าจอรองรับการ Scroll เมื่อเนื้อหาเกินความสูงหน้าจอ
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------------------------------------------------------------
              // ส่วนที่ 1: รูปโปรไฟล์ + สถิติ (โพสต์, ผู้ติดตาม, กำลังติดตาม)
              // -------------------------------------------------------------
              Row(
                children: [
                  // ภาพโปรไฟล์ใช้ไฟล์ภาพจากในโปรเจกต์ (AssetImage)
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2.5,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 42,
                      // โหลดภาพโปรไฟล์จาก assets/images/photo.jpg ในโปรเจกต์
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // แสดงสถิติ 3 ช่อง (โพสต์, ผู้ติดตาม, กำลังติดตาม)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatColumn('24', 'โพสต์'),
                        _buildStatColumn('1.5M', 'ผู้ติดตาม'),
                        _buildStatColumn('500', 'กำลังติดตาม'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // -------------------------------------------------------------
              // ส่วนที่ 2: ข้อมูลนักศึกษา และแคปชัน/คำคม
              // -------------------------------------------------------------
              const Text(
                'ชื่อ-ปรีชญา แสงอรุณ tit11 เลขที่ 04', // ชื่อนักศึกษา
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'นักศึกษาแผนกเทคโนโลยีสารสนเทศ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'ผมเป็นดาราครับชื่อโจนาทานเดวิสแดร์ห้องtit1/1!"',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 20),

              // -------------------------------------------------------------
              // ส่วนที่ 3: ปุ่มกด (ปุ่มติดตาม แบบทึบ & ปุ่มข้อความ แบบมีเส้นขอบ)
              // -------------------------------------------------------------
              Row(
                children: [
                  // ปุ่มติดตาม: ปุ่มแบบทึบ (ElevatedButton/FilledButton)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person_add, size: 18),
                      label: const Text(
                        'ติดตาม',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // ปุ่มข้อความ: ปุ่มแบบมีเส้นขอบ (OutlinedButton)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat_bubble_outline, size: 18),
                      label: const Text(
                        'ข้อความ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // เส้น Divider คั่นส่วนเนื้อหา
              const Divider(thickness: 1.0),
              const SizedBox(height: 16),

              // หัวข้อส่วนแสดงผลงาน/ภาพประกอบ
              const Row(
                children: [
                  Icon(Icons.grid_on, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'โพสต์',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // -------------------------------------------------------------
              // ส่วนที่ 4: ภาพประกอบ 3 ภาพ ใช้ภาพจริงของนักศึกษาจากโปรเจกต์ (Image.asset)
              // -------------------------------------------------------------
              Row(
                children: [
                  _buildAssetImage('assets/images/photo.jpg'), // รูปที่ 1: photo.jpg
                  const SizedBox(width: 8),
                  _buildAssetImage('assets/images/photo_2.jpg'), // รูปที่ 2: photo_2.jpg
                  const SizedBox(width: 8),
                  _buildAssetImage('assets/images/photo_3.jpg'), // รูปที่ 3: photo_3.jpg
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // Helper Widget 1: สร้าง Column สำหรับแสดงตัวเลขสถิติและป้ายชื่อ
  // -------------------------------------------------------------------------
  Widget _buildStatColumn(String count, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // -------------------------------------------------------------------------
  // Helper Widget 2: แสดงรูปภาพจากในโปรเจกต์ (Image.asset) พร้อมจัดรูปแบบ 1:1 และขอบมน
  // -------------------------------------------------------------------------
  Widget _buildAssetImage(String assetPath) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.0, // อัตราส่วน 1:1 (สี่เหลี่ยมจัตุรัส)
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // ขอบรูปภาพมน 10px
          child: Image.asset(
            assetPath,
            fit: BoxFit.cover, // ปรับรูปภาพให้เต็มพื้นที่อย่างสวยงาม
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.grey),
              );
            },
          ),
        ),
      ),
    );
  }
}
