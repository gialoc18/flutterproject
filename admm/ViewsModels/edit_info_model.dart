import 'dart:async';
import 'dart:convert';
import 'package:flutterapp1/admm/Models/account.dart';
import 'package:intl/intl.dart';
import '../import.dart';
import 'package:http/http.dart' as http;

class EditInfoModel extends ChangeNotifier{
  final _httpClient = http.Client();
  Account _fields = Account(
    fullName: (account.fullName != null)?account.fullName:'',
    email: (account.email != null)?account.email:'',
    phone: (account.phone != null)?account.phone:'',
    gender: (account.gender != null)?account.gender:'',
    birthDate: (account.birthDate != null)?account.birthDate:'',
    address: (account.address != null)?account.address:'',
    avatar: (account.avatar != null)?account.avatar:'',
  );
  var _msg;
  String _submitStatus = '';

  StreamController _msgController = new StreamController();
  StreamController _fullNameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _genderController = new StreamController();
  StreamController _birthDateController = new StreamController();
  StreamController _addressController = new StreamController();
  StreamController _avatarController = new StreamController();

  String get submitStatus => _submitStatus;
  Stream get msgStream => _msgController.stream;
  Stream get fullNameStream => _fullNameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get genderStream => _genderController.stream;
  Stream get birthDateStream => _birthDateController.stream;
  Stream get addressStream => _addressController.stream;
  Stream get avatarStream => _avatarController.stream;
  Account get getFields => _fields;
  dynamic get getMsg => _msg;



  set fullName(String newVal) {
    _fields.fullName = newVal;
    _fullNameController.add('OK');
  }
  set email(String newVal){
    _fields.email = newVal;
    _emailController.add('OK');
  }
  set phone(String newVal){
    _fields.phone = newVal;
    _phoneController.add('OK');
  }
  set gender(String newVal){
    _fields.gender = newVal;
    _genderController.add('OK');
  }
  set birthDate(DateTime newVal){
    _fields.birthDate = DateFormat('dd/MM/yyyy').format(newVal);
    _birthDateController.add('OK');
  }
  set address(String newVal){
    _fields.address = newVal;
    _addressController.add('OK');
  }
  set avatar(String newVal) {
    _fields.avatar = newVal;
    _avatarController.add('OK');
  }

  void validateAndSubmit(){
    if(isValidUpdateProfile(_fields) == true){
      _sendDomesticDeclaration();
    }
  }

  static EditInfoModel of(BuildContext context) {
    return Provider.of<EditInfoModel>(context);
  }

  Future<void> _sendDomesticDeclaration() async {
    _submitStatus = 'SENDING';
    print(_submitStatus);
    notifyListeners();
    var url = sendReportAPI;
    final response = await _httpClient.post(
        url,
        body: {'fields':json.encode(_fields.toJson())}
    );
    if (response.statusCode != 200 && response.statusCode != 201)
      throw http.ClientException(
          'Cập nhật thất bại');
  }

  Future<bool> signOut() async{
    prefsGlobal.remove('token');
    prefsGlobal.remove('account');
    return true;
  }

  bool isValidUpdateProfile(Account fields) {
    int _check = 0;
    if (fields.fullName == null|| fields.fullName == '') {
      _fullNameController.addError('Bạn chưa nhập họ tên');
      _check++;
    }else if(fields.fullName.length >= 100){
      _fullNameController.addError('Họ tên không được quá 100 ký tự');
      _check++;
    }
    if (fields.email == null || fields.email == '') {
      _emailController.addError('Bạn chưa nhập Email');
      _check++;
    }
    if (fields.phone == null || fields.phone == '') {
      _phoneController.addError('Bạn chưa nhập SĐT');
      _check++;
    }

    if (fields.birthDate == null || fields.birthDate == '') {
      _birthDateController.addError('Bạn chưa chọn ngày sinh');
      _check++;
    }
    if (fields.gender == null || fields.gender == '') {
      _genderController.addError('Bạn chưa chọn giới tính');
      _check++;
    }
    if (_check > 0) {
      _msgController.addError('$_check lỗi. Bạn vui lòng kiểm tra lại thông tin.');
      return false;
    }
    _msgController.add('OK');
    return true;
  }


  @override
  void dispose() {
    _msgController.close();
    _fullNameController.close();
    _emailController.close();
    _phoneController.close();
    _birthDateController.close();
    _genderController.close();
    _addressController.close();
    _avatarController.close();
    super.dispose();
  }
}

