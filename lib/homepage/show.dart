import 'package:flutter/material.dart';

class Show extends StatelessWidget {
  final double bmiValue;
  final String name;

  const Show({Key? key, required this.bmiValue, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String result;
    Color resultColor;

    if (bmiValue < 18.5) {
      result = 'น้ำหนักน้อยกว่ามาตรฐาน ควรกินให้เยอะหน่อยน่ะ';
      resultColor = Colors.blue; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
      result = 'น้ำหนักปกติ เก่งมากเลย';
      resultColor = Colors.green; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 25 && bmiValue <= 29.9) {
      result = 'น้ำหนักเกินมาตรฐาน ควบคุมอาหารหน่อยน่ะ';
      resultColor = Colors.orange; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else if (bmiValue >= 30 && bmiValue <= 34.9) {
      result = 'โรคอ้วน หาเวลาออกกำลังกายด้วยน่ะ';
      resultColor = Colors.red; // หรือสีอื่นๆ ตามที่คุณต้องการ
    } else {
      result = 'โรคอ้วนขั้นสูง ต้องเข้าคอสลดน้ำหนักด่วน';
      resultColor = Colors.purple; // หรือสีอื่นๆ ตามที่คุณต้องการ
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ผลการคำนวณ BMI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'คุณ ${name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'ค่า BMI : ${bmiValue.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                color: resultColor, // ใช้ resultColor ที่ได้จากเงื่อนไข BMI
                fontSize: 24, // ตั้งค่าขนาดตัวอักษรตามที่คุณต้องการ
                fontWeight: FontWeight.bold, // ตั้งค่าความหนาของตัวอักษร
              ),
            ),
            Image.network(
              'https://st.depositphotos.com/5524162/54213/v/1600/depositphotos_542130266-stock-illustration-bmi-for-women-body-mass.jpg',
              height: 500,
              width: 1000,
            )
          ],
        ),
      ),
    );
  }
}
