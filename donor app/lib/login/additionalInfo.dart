import 'package:donor_app/config/assetCatalog.dart';
import 'package:flutter/material.dart';


class AdditionalInfo extends StatefulWidget {
  @override
  _AdditionalInfo createState() => _AdditionalInfo();
}

class _AdditionalInfo extends State<AdditionalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset(
          Assets.backIcon,
          scale: 5,
        ),
        title: Image.asset(
          Assets.logo,
          scale: 36,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff2455EF),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 1 / 6,
                height: 45,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffD1E7F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Verify your Identify",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Enter the following detail to verify\nyour identity.",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            width: 0.2,
                            color: Color(0xffFAFAFA),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        fillColor: Color(0xffFAFAFA),
                        filled: true,
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            width: 0.2,
                            color: Color(0xffFAFAFA),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        fillColor: Color(0xffFAFAFA),
                        filled: true,
                        hintText: "Identification No.",
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            width: 0.2,
                            color: Color(0xffFAFAFA),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        suffixIcon: Icon(Icons.camera_alt_outlined),
                        fillColor: Color(0xffFAFAFA),
                        filled: true,
                        hintText: "Upload  Registration Certification",
                        hintStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Any other document that you want to upload as proof of identity/doctor.",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff5E5E5E),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7.0),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              margin: EdgeInsets.only(right: 2.5),
                              child: Icon(
                                Icons.file_upload,
                              ),
                            ),
                            //Image.asset(Assets.kUpload)),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7.0),
                                ),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              margin: EdgeInsets.only(left: 2.5),
                              child: Icon(
                                Icons.file_upload,
                              ),
                            ),
                            //Image.asset(Assets.kUpload)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "* If your verification is succesful you will receive a confirmation mail.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(
                           // context, ROUTES.DOCTOR_REGIS_COMPLETE);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff2AA4F4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(7.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "VERIFY",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
