import 'package:bmi142/homepage/show.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController name = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    heightController.text = '';
    weightController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculater"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text('ชื่อ-นามสกุล'),
              TextFormField(
                textAlign: TextAlign.center,
                controller: name,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 20),
              const Text('ส่วนสูง (Height)'),
              TextFormField(
                textAlign: TextAlign.center,
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 20),
              const Text(
                'น้ำหนัก (Weight)',
              ),
              TextFormField(
                textAlign: TextAlign.center,
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  double weight = double.tryParse(weightController.text) ?? 0;
                  double heightInCm =
                      double.tryParse(heightController.text) ?? 0;
                  double bmi;

                  if (heightInCm > 0 && weight > 0) {
                    double heightInMeters = heightInCm / 100;
                    bmi = weight / (heightInMeters * heightInMeters);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Show(bmiValue: bmi, name: name.text),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('กรุณาป้อนเลข'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('คำนวณ BMI'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
