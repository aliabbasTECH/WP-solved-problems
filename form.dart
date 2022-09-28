import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mailer/smtp_server.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mailer/mailer.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../config/Google_auth_Api.dart';



class FormScreen extends StatefulWidget {
  const FormScreen({ Key? key }) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  
  dynamic _name;
  dynamic _email;
  dynamic _Category;
  dynamic _Urgent_Or_Normal;
  dynamic _JobDescription;
  dynamic _Service;
  dynamic _PhoneNumber;
  dynamic _OrderFromCompleteAddr;
  dynamic _DeleveryAddr;
  dynamic _ReceverName;
  dynamic _ReceverContact;
  DateTime _OrderDate= DateTime.now();
  dynamic _HalfPaymentRecpitImage;
  dynamic _AnyRefImage;

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
                 
 
 void  showSnakBar(String text){
                    final snackBar = SnackBar(
                        content: Text(
                        text,
                        style: TextStyle(fontSize: 20),) );
                         ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(snackBar);
                        }

  
    Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 18,
      validator: (String ?value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String ?value) {
        _name = value;
      },
    );
  }
    Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String ?value) {
        if (value!.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String ?value) {
        _email = value;
      },
    );  
  }
    Widget _buildCategory() {
    return  Column(
      children: [
        SizedBox(height: 12,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Category:" )),

        DropdownButton(
          
          hint: _Category == null
              ? const Text('Designing')
              : Text(
                  _Category,
                  style: TextStyle(color: Colors.black),
                ),
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30.0,
          style: TextStyle(color: Colors.black),
          items: ['Designing', 'Sampling', 'Production'].map(
            (val) {
              return DropdownMenuItem<String>(
                value: val,
                child: Text(val),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                _Category = val;

              },
            );
          },
          
          
        ),
      ],
    );
   
  }
  //   Widget? _buildUrgetOrNormal() {
  //   return null;  
  // }
    Widget _build_JobDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'JobDescription'),
      validator: (String ?value) {
        if (value!.isEmpty) {
          return 'Job Description is Required';
        }
        return null;
      },
      onSaved: (String ?value) {
        _JobDescription = value;
      },
    );
  }
    Widget _build_Service() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Service'),
      validator: (String ?value) {
        if (value!.isEmpty) {
          return 'provide Service what you prefer ';
        }
        return null;
      },
      onSaved: (String ?value) {
        _Service = value;
      },
    ); 
  }
    Widget _build_PhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (dynamic value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (dynamic value) {
        _PhoneNumber = value;
      },
    ); 
  }
     Widget _build_OrderFromCompleteAddr() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Order From Complete Address'),
      validator: (String ?value) {
        if (value!.isEmpty) {
          return 'plese provide address ';
        }
        return null;
      },
      onSaved: (String ?value) {
        _OrderFromCompleteAddr = value;
      },
    );  
  }
    Widget _build_DeleveryAddr() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Delivery Address'),
      validator: (String ?value) {
        if (value!.isEmpty) {
          return 'plese provide delivery address ';
        }
        return null;
      },
      onSaved: (String ?value) {
        _DeleveryAddr = value;
      },
    );   
  }
    Widget _build_ReceverName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'ReceverName'),
      maxLength: 18,
      validator: (String ?value) {
        if (value!.isEmpty) {
          return 'plese provide ReceverName  ';
        }
        return null;
      },
      onSaved: (String ?value) {
        _ReceverName = value;
      },
    );   
  }
    Widget _build_ReceverContact() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Reciver Contact '),
      keyboardType: TextInputType.phone,
      validator: (dynamic value) {
        if (value!.isEmpty) {
          return 'Contact number is Required';
        }

        return null;
      },
      onSaved: (dynamic value) {
        _ReceverContact = value;
      },
    );  
  }
    Widget _build_OrderDate() {
    return Container(
      child:Column(
        children: [
        SizedBox(height: 12,),
        Align(alignment: Alignment.centerLeft,
          child: Text("Order Date:", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
          Row(children: [
            Text('${_OrderDate.year}/${_OrderDate.month}/${_OrderDate.day}'),
             Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 144, 41, 103)),
              onPressed:() async{
               DateTime? newDate= await showDatePicker(
                  context: context, 
                  initialDate: _OrderDate, 
                  firstDate: DateTime(1950), 
                  lastDate: DateTime.now(),
                  );
                  if(newDate == null)return;
                  setState(()=> _OrderDate=newDate);
              } , 
              child: Icon(Icons.date_range))
          ],)

        ],
      )

    );  
  }
    Widget _build_HalfPaymentRecpitImage() {
    return  Container(
      child:Column(
        children: [
        SizedBox(height: 12,),
        Align(alignment: Alignment.centerLeft,
          child: Text("50% Payment recipet image :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold), )),
          Row(children: [
            Text(_HalfPaymentRecpitImage == null ? "No Image": "Image Load"),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 144, 41, 103)),
              onPressed:() async{
                try {
                  final _HalfPaymentRecpitImage= await ImagePicker().pickImage(source: ImageSource.gallery);
                 if(_HalfPaymentRecpitImage ==null)return; 
                 final imageTemporary = File(_HalfPaymentRecpitImage.path);
                 setState(()=> this._HalfPaymentRecpitImage = imageTemporary);
                } on PlatformException catch(e){
                  print("failed to Pick Image: $e");
                }
              },
              
              child:Icon(Icons.file_present, size:25 )
              )
          ],)

        ],
      )

    );  
  }
    Widget _build_AnyRefImage() {
    return Container(
      child:Column(
        children: [
        SizedBox(height: 12,),
        Align(alignment: Alignment.centerLeft,
          child: Text("Any RefranceImage:",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),  )),
          Row(children: [
            Text(_AnyRefImage == null ? "No Image": "Image Load"),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 144, 41, 103)),
              onPressed:() async{
                try {
                  final _AnyRefImage= await ImagePicker().pickImage(source: ImageSource.gallery);
                 if(_AnyRefImage ==null)return; 
                 final imageTemporary = File(_AnyRefImage.path);
                 setState(()=> this._AnyRefImage = imageTemporary);
                } on PlatformException catch(e){
                  print("failed to Pick Image: $e");
                }
              },
              
              child:Icon(Icons.file_present, size:25 )
              )
          ],)

        ],
      )

    );  
  }


  @override
  Widget build(BuildContext context) {
               
    return Scaffold(
      appBar: AppBar(
      title: Text("form"),
      backgroundColor: Color.fromARGB(255, 144, 41, 103), ),
      body:  SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildCategory(),
                // _buildUrgetOrNormal(),
                _build_JobDescription(),
                _build_Service(),
                _build_PhoneNumber(),
                _build_OrderFromCompleteAddr(),
                _build_DeleveryAddr(),
                _build_ReceverName(),
                _build_ReceverContact(),
                _build_OrderDate(),
                _build_HalfPaymentRecpitImage(),
                _build_AnyRefImage(),
                SizedBox(height: 50,),
                ElevatedButton(
                  child:Text("Submit",style:TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),),
                       style: ElevatedButton.styleFrom(
                       primary: Color.fromARGB(255, 144, 41, 103),
                       minimumSize: const Size.fromHeight(50), // NEW
                      ),
                  onPressed: () async{
                    if(!_formKey.currentState!.validate()){
                      return;
                    }
                    _formKey.currentState!.save(); 
                    // GoogleAuthApi.signOut();
                    // return;
                    final user = await GoogleAuthApi.signIn();
                    if (user == null)return;
                    final email = user.email;
                    final auth= await user.authentication;
                    final token = auth.accessToken!;
                    final smtpServer= gmailSaslXoauth2(email, token);
                     print("=======>${email}");
                    final message = Message()
                    ..from = Address(email)
                    ..recipients=["aliabbas.tech03@gmail.com"]
                    ..subject = "Hello Aliabbas"
                    ..text= 'This is a test email!'
                    ..html= '<h1>User Order Details<h1><div><table><th style="font-size:30px; border: none;">USER Service Order</th><tr><th>name</th><td>$_name</td></tr><tr><th>email</th><td>$_email</td></tr><tr><th>Category</th><td>$_Category</td></tr><tr><th>_Urgent_Or_Normal</th><td>$_Urgent_Or_Normal</td></tr><tr><th>_JobDescription</th><td>$_JobDescription</td></tr><tr><th>_Service</th><td>$_Service</td></tr><tr><th>_PhoneNumber</th><td>$_PhoneNumber</td></tr><tr><th>_OrderFromCompleteAddr</th><td>$_OrderFromCompleteAddr</td></tr><tr><th>DeleveryAddr</th><td>$_DeleveryAddr</td></tr><tr><th>_ReceverName</th><td>$_ReceverName</td></tr><tr><th>_ReceverContact</th><td>$_ReceverContact</td></tr><tr><th>_OrderDate</th><td>$_OrderDate</td></tr><tr><th>HalfPaymentRecpitImage</th><td>$_HalfPaymentRecpitImage</td></tr><tr><th>AnyRefImage</th><td>$_AnyRefImage</td></tr></table><style>table {font-family: arial, sans-serif;border-collapse: collapse;width: 40%;}td, th {border: 1px solid #dddddd;text-align: left;padding: 8px;}</style></div>';
                    
                     try {
                        await send(message, smtpServer);
                        showSnakBar('sent email successfully!');
                     } on MailerException catch (e) {
                      print("this is error========> $e");
                     }
                  
                    
                  }
                  
                  ),
                 

              ],
            ) 
        ),
         
          ),
      ),
    );
  }
   
}







// Future<void> send() async {
//     final Email email = Email(
//       subject: 'USER Service Order',
//       recipients: ["aliabbas.tech05@gmail.com"],
//       // cc: ['aliabbas.tech03@gmail.com'],
//       // bcc: ['aliabbas.tech03@gmail.com'],
//       attachmentPaths: [_AnyRefImage],
//       body: 'USER Service Order \n name: $_name  \n email: $_email \n Category: $_Category \n _Urgent_Or_Normal: $_Urgent_Or_Normal \n _JobDescription: $_JobDescription \n _Service: $_Service \n _PhoneNumber: $_PhoneNumber \n _OrderFromCompleteAddr: $_OrderFromCompleteAddr \n DeleveryAddr :$_DeleveryAddr \n _ReceverName: $_ReceverName \n _ReceverContact :$_ReceverContact \n _OrderDate: $_OrderDate \n HalfPaymentRecpitImage: ${_HalfPaymentRecpitImage} \n AnyRefImage:$_AnyRefImage',
//       isHTML: false,
      
//     );
// String platformResponse;
//     try   {
//       await FlutterEmailSender.send(email);
//       platformResponse = 'success';
//     } catch (error) {
//       print(error);
//       platformResponse = error.toString();
//     }
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(platformResponse),
//       ),
//     );
//   }
