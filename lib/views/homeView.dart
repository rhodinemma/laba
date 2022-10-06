// ignore_for_file: file_names, unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:laba/constants.dart';
import 'package:laba/views/details/components/body.dart';
import 'package:laba/views/localAndWebObjectsView.dart';
import 'package:laba/views/objectsOnPlanes.dart';
import 'package:laba/views/product/productsScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ObjectsOnPlanesWidget()));
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(fontSize: 25),
            elevation: 5,
          ),
          icon: const Icon(
            Icons.arrow_forward,
            size: 50,
          ),
          label: const Text("Try a product"),
        ),
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        curve: Curves.easeInCirc,
        backgroundColor: kPrimaryColor,
        color: Colors.white,
        activeColor: Colors.white,
        tabs: [
          const GButton(
            icon: Icons.home,
            text: 'Home',
            iconSize: 35,
            // onPressed: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => build(context),
            //     ),
            //   );
            // },
          ),
          GButton(
            icon: Icons.lightbulb,
            text: 'Feedback',
            iconSize: 35,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserGuide()),
              );
            },
          ),
          GButton(
            icon: Icons.exit_to_app,
            text: 'Exit',
            iconSize: 35,
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}

class UserGuide extends StatefulWidget {
  const UserGuide({Key? key}) : super(key: key);

  @override
  State<UserGuide> createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  // we have initialized active step to 0 so that
  int _activeCurrentStep = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  // Here we have created list of steps
  List<Step> stepList() => [
        // This is step1 which is called Account.
        // Here we will fill our personal details
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: const Text('Feedack Section 1'),
          content: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Did the application meet your expectations?',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Will you use this feature before buying online?',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: pass,
                // obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Do you think adults of all ages can use this feature?',
                ),
              ),
            ],
          ),
        ),
        // This is Step2 here we will enter our address
        Step(
            state: _activeCurrentStep <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: _activeCurrentStep >= 1,
            title: const Text('Feedback Section 2'),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: address,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Do you prefer buying online without this feature?',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: pincode,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tell us any problems while using the feature?',
                  ),
                ),
              ],
            )),

        // This is Step3 here we will display all the details
        // that are entered by the user
        Step(
            state: StepState.complete,
            isActive: _activeCurrentStep >= 2,
            title: const Text('Submit'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Text('Did the application meet your expectations? ${name.text}'),
            Text('Will you use this feature before buying online? ${email.text}'),
            Text('Do you think adults of all ages can use this feature? ${pass.text}'),
            Text('Do you prefer buying online without this feature? ${address.text}'),
            Text('Tell us any problems while using the feature? ${pincode.text}'),
              ],
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback Section')),
      // Here we have initialized the stepper widget
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _activeCurrentStep,
        steps: stepList(),

        // onStepContinue takes us to the next step
        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }
        },

        // onStepCancel takes us to the previous step
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },

        // onStepTap allows to directly click on the particular step we want
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
    );
  }
}
