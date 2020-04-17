import 'package:flutter/material.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => new _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  List<Step> steps = [
    Step(
      isActive: true,
      title: const Text('Tài khoản',style: TextStyle(fontSize: 12.0),),
      state: StepState.editing,
      content: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Vui lòng nhập tài khoản hoặc email:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Tài khoản'),
          ),
        ],
      ),
    ),
    Step(
      state: StepState.editing,
      title: const Text('Xác nhận',style: TextStyle(fontSize: 12.0),),
      content: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nhập mã bảo mật:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Xin vui lòng kiểm tra email (spam) và nhập mã bảo mật*'
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Nhập mã bảo mật hệ thống đã gửi'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.complete,
      title: const Text('Mật khẩu',style: TextStyle(fontSize: 12.0),),
      content: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nhập mật khẩu mới:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Mật khẩu mới'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Nhập lại mật khẩu mới'),
          ),
        ],
      ),
    ),
  ];

  StepperType stepperType = StepperType.horizontal;


  int currentStep = 0;
  bool complete = false;
  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }

  switchStepType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
            'Quên mật khẩu',
            style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          complete ? Expanded(
            child: Center(
              child: AlertDialog(
                title: new Text("Thay đổi mật khẩu thành công"),
                content: new Text(
                  "Tada!",
                ),

                actions: <Widget>[
                  FlatButton(
                    child: new Text("Close"),
                    onPressed: () {
                      setState(() => complete = false);
                    },
                  ),
                ],
              ),
            ),
          )
              : Expanded(
            child: Stepper(
              type: stepperType,
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
          ),
        ],
      ),
    );
  }
}