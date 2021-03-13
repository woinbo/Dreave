import 'package:flutter/material.dart';

showAlertDialog(String message, BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) => Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 100,
                width: 300,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Text(
                        message,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(
                        //   child: InkWell(
                        //     onTap: () => {
                        //       Navigator.pop(context),
                        //     },
                        //     child: Container(
                        //       height: 30,
                        //       decoration: BoxDecoration(
                        //         color: MyColors.primaryColorLight,
                        //         borderRadius: BorderRadius.only(
                        //             bottomLeft: Radius.circular(8)),
                        //       ),
                        //       child: Center(
                        //         child: Text(
                        //           "Cancel",
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          child: InkWell(
                            onTap: () => {
                              Navigator.pop(context),
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                // color: MyColors.primaryColor,
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Ok",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ),
          ));
}
