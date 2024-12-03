import 'dart:math';

import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double height = 181;

  int weight = 92;
  int age = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Body Mass Index",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // * Gender Selector
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    genderSelector(context, "male"),
                    const SizedBox(width: 15),
                    genderSelector(context, "female"),
                  ],
                ),
              ),
            ),
            // * Height Selector
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal.withOpacity(0.8),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "cm",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        Slider(
                          min: 90,
                          max: 220,
                          value: height,
                          onChanged: (newValue) =>
                              setState(() => height = newValue),
                        )
                      ]),
                ),
              ),
            ),

            // * Weight - Age Selector
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    weightAgeSelector(context, "weight"),
                    const SizedBox(width: 15),
                    weightAgeSelector(context, "age"),
                  ],
                ),
              ),
            ),
            // * Calculate Button
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 14,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow(height / 100, 2);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Result(result: result, isMale: isMale, age: age);
                  }));
                },
                child: Text(
                  "Calculate",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderSelector(BuildContext context, String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (gender == "male") ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                (isMale && gender == "male") || (!isMale && gender == "female")
                    ? Colors.teal
                    : Colors.teal.withOpacity(0.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(gender == "male" ? Icons.male : Icons.female),
              const SizedBox(height: 10),
              Text(
                gender == "male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded weightAgeSelector(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal.withOpacity(0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == "age" ? "Age" : "Weight",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              type == "age" ? "$age" : "$weight",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == "age" ? "age--" : "weight--",
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  onPressed: () =>
                      setState(() => type == "age" ? age-- : weight--),
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: type == "age" ? "age++" : "weight++",
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  onPressed: () =>
                      setState(() => type == "age" ? age++ : weight++),
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
