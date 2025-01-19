import 'package:flutter/material.dart';
import 'package:social_project/pages/mainPage.dart';


class Termsscreen extends StatefulWidget {
  const Termsscreen({super.key});

  @override
  State<Termsscreen> createState() => _TermsscreenState();
}

dynamic checkBoxValue = false;

class _TermsscreenState extends State<Termsscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[900]),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "User Agreement ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                        Text(
                          '''
                    
          Welcome to Service Finder App!
                          
                   This User Agreement is a legally binding contract between you and Service Finder App . By accessing or using our application  or any associated services, you agree to comply with and be bound by this Agreement. If you do not agree to these terms, please do not use our App or Services.
                  
                          
1. Acceptance of Terms
            By using the App, you confirm that you are at least 18 years old or have obtained parental/guardian consent to use the App. You agree to be bound by this Agreement and any additional terms and conditions provided within the App.
                  
                          
2. User Account
        2.1 Registration
            You must create an account to use certain features of the App. You agree to provide accurate, current, and complete information during the registration process.
                          
        2.2 Account Security
            You are responsible for safeguarding your account credentials. You agree not to share your password with others and to notify us immediately of any unauthorized use of your account.
                  
                          
3. Use of the App
        3.1 Permitted Use
            You agree to use the App only for lawful purposes and in accordance with this Agreement.
                          
        3.2 Prohibited Activities
            You agree not to:
                  - Misuse or interfere with the Apps functionality.
                  - Upload or transmit harmful code, viruses, or malware.
                  - Engage in any activity that violates local, state, national, or international laws.
                  
                          
4. Data Privacy
            Your privacy is important to us. Since this is a college project, we ensure that user data will not be shared or used for commercial purposes.
                  
                          
5. Intellectual Property
            All content and materials within the App, including but not limited to text, graphics, logos, and software, are the property of Service Finder App and are protected by applicable intellectual property laws. You may not copy, modify, distribute, or create derivative works from any part of the App without prior written permission.
                  
                          
6. Limitation of Liability
            To the fullest extent permitted by law, Service Finder App shall not be liable for any indirect, incidental, or consequential damages arising out of or in connection with your use of the App or Services.
                  
                        
7. Termination
            We reserve the right to terminate or suspend your account at any time, without notice, if we believe you have violated this Agreement.
                          
                          
8. Changes to the Agreement
            We may update this Agreement from time to time. Any changes will be effective upon posting within the App. Your continued use of the App after changes are posted constitutes acceptance of the revised Agreement.
                          
                          
9. Governing Law
            This Agreement shall be governed by and construed in accordance with the laws of India, Kerala.
                           
                          
10. Contact Information
                          
            If you have any questions or concerns about this Agreement, please contact us at:
                          
            Service Finder App Team  
            Email: vaishnavjs14@gmail.com  
            Phone: XXXXXXXXXX
                  
              By using Service Finder App, you acknowledge that you have read, understood, and agree to this User Agreement.''',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: checkBoxValue,
                          activeColor: Colors.red[300],
                          onChanged: (new_val_checkBox) {
                            setState(() {
                              checkBoxValue = new_val_checkBox;
                            });
                          }),
                      Center(
                        child: Text(
                          '''I read and accept the terms and
conditions mentioned above''',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.grey[900])),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return Mainpage();
                          }), (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "                 Confirm                 ",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
