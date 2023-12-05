import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:clipboard/clipboard.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    backgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = '';
  String message = '';
  String token = '';
  String ToEmail = '';


  Future<void> fetchData() async {
    final url = "https://free-tempmail-api.p.rapidapi.com/newmail";

    final headers = {
      "X-RapidAPI-Key": "f8dc80a4f6mshd9276ef433304e8p1c5755jsnd7fe9f7b9aa3",
      "X-RapidAPI-Host": "free-tempmail-api.p.rapidapi.com"
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    final info = jsonDecode(response.body);
    final email = info["newmail"]["email"].toString();
    final token = info["newmail"]["token"].toString();

    final mailsUrl = "https://free-tempmail-api.p.rapidapi.com/mails";
    final mailsHeaders = {
      "mailtoken": token,
      "X-RapidAPI-Key": "f8dc80a4f6mshd9276ef433304e8p1c5755jsnd7fe9f7b9aa3",
      "X-RapidAPI-Host": "free-tempmail-api.p.rapidapi.com"
    };

    final mailsResponse = await http.get(Uri.parse(mailsUrl), headers: mailsHeaders);
    final mailsInfo = jsonDecode(mailsResponse.body);
    final message = mailsInfo["message"].toString();

    setState(() {
      this.email = email;
      this.token = token;
      this.message = message;
    });
  }

  Future<void> updateMessage() async {
    final mailsUrl = "https://free-tempmail-api.p.rapidapi.com/mails";
    final mailsHeaders = {
      "mailtoken": token,
      "X-RapidAPI-Key": "f8dc80a4f6mshd9276ef433304e8p1c5755jsnd7fe9f7b9aa3",
      "X-RapidAPI-Host": "free-tempmail-api.p.rapidapi.com"
    };

    final mailsResponse = await http.get(Uri.parse(mailsUrl), headers: mailsHeaders);
    final mailsInfo = jsonDecode(mailsResponse.body);
    final updatedMessage = mailsInfo["mails"][0]["intro"].toString();
    final ToEmail = mailsInfo["mails"][0]["from"]["address"].toString();
    print(mailsInfo);
    setState(() {
      this.message = updatedMessage;
      this.ToEmail = ToEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake email'),
      ),
      body: SingleChildScrollView(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:70.0,vertical:20),
        child: Column(
        children: [
        SizedBox(
        height: 200,
        child: Image.asset("images/Mail-icon.png"),
        ),
        const SizedBox(
          height: 30,
    ),
      const Center(
          child: Text("خدمة البريد المؤقت تتيح لك الحصول على بريد مؤقت او بريد مهمل لاستخدامه كيفما شئت",
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
       const SizedBox(
          height: 10,
    ),
      ],
    ),
),     
      
      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), 
      ),
      onPressed: fetchData,
      child: Text('Change E-mail'),
    ),
    SizedBox(width: 20),
    ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green), 
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), 
      ),
      onPressed: updateMessage,
      child: Text('Update Message'),
    ),
  ],
),

SizedBox(height: 20),
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 3,
      ),
    ],
  ),
  padding: EdgeInsets.all(10),
  child: Column(
    children: [
      Row(
        children: [
          Text(
            'Email: $email',
            style: TextStyle(fontSize: 15),
          ),
          IconButton(
            onPressed: () {
            Clipboard.setData(ClipboardData(text: email));
            },
            icon: Icon(Icons.copy_all),
            color: Colors.purple, 

          ),
        ],
      ),
          ],
  ),
),
SizedBox(height: 20),
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 3,
      ),
    ],
  ),
  padding: EdgeInsets.all(10),
  child: Column(
    children: [
      SizedBox(height: 10),
      Text(
        '''
to : $ToEmail

Message: 
        
$message''',
        
        style: TextStyle(fontSize: 15),
        ),
          IconButton(
            onPressed: () {
            Clipboard.setData(ClipboardData(text: message));
            },
            icon: const Icon(Icons.copy_all),
            color: Colors.purple, 
          ),
          ],
        ),
      ),
      const SizedBox(
          height: 50,
    ),
      const Center(
          child: Text("0xfff0800 اصدار التطبيق 1.0.0 تمت برمجته بواسطة",
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
       const SizedBox(
          height: 10,
    ),
    ],
  ),
),
    );
  }
}