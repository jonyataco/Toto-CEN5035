import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TotoSetting extends StatelessWidget{
  //  final String settingTitle;
  //  final String settingDescription;
    const TotoSetting({
      this.label,
      this.padding,
      this.groupValue,
      this.value,
      this.onChanged,
    });
  //  TotoSetting(
  //    this.settingTitle,
  //    this.settingDescription,
  //  );
    final String label;
    final EdgeInsets padding;
    final bool groupValue;
    final bool value;
    final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child:Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Switch(
              value: value,
              onChanged: (bool newValue){
                onChanged(newValue);
              },),
          ],
        )));
  }
    // Building a container for the notification that defines height and width.
  //   return Container(
  //     width: double.infinity,
  //     height: 70,
  //     // Definining Border of the container
  //     decoration: BoxDecoration(
  //       border: Border(bottom: BorderSide(width: 1.0, color: Colors.black)),
  //     ),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           flex: 9,
  //           child: Container(
  //             padding: EdgeInsets.all(8),
  //             child: Column(
  //               // The alignment for items in the column
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text(
  //                   settingTitle,
  //                   style: TextStyle(
  //                     fontSize: 24,
  //                   )
  //                 ),
  //                 Text(
  //                   settingDescription,
  //                   style: TextStyle(fontSize: 18, color: Colors.grey)
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 1,
  //           child: Container(
  //             child: Icon(
  //               Icons.opacity,
  //               size: 40,
  //             )
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}