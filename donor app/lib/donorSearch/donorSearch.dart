import 'package:donor_app/config/assetCatalog.dart';
import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";

class DonorSearch extends StatefulWidget {
  @override
  _DonorSearch createState() => _DonorSearch();
}

class _DonorSearch extends State<DonorSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: SvgPicture.asset(
          Assets.backIcon,
        ),
        title: Text("REQUEST"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Text(
                    "To get help enter the specific blood group you require and wait for 5 minutes..")),
            Expanded(child: Text("Select the Blood Group you require.")),
            Expanded(child: Image.asset(Assets.kGlobe)),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                  decoration: BoxDecoration(
                    color: Color(0xffE04E4E),
                    borderRadius: BorderRadius.all(
                      Radius.circular(36.0),
                    ),
                  ),
                  child: Text(
                    "EMRGENCY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
