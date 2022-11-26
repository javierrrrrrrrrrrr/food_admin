import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../Providers/up_image_provider.dart';

class CustomToggleButtom extends StatelessWidget {
  const CustomToggleButtom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<UPImageProvider>(context);
    final size = MediaQuery.of(context).size;
    return imageProvider.image == null
        ? ToggleSwitch(
            minWidth: size.width * 0.15,
            minHeight: size.height * 0.06,
            initialLabelIndex: 0,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            icons: const [
              Icons.camera,
              Icons.image,
            ],
            iconSize: 30.0,
            activeBgColors: [
              [Colors.orange.withOpacity(0.5), Colors.orange],
              [Colors.orange.withOpacity(0.5), Colors.orange]
            ],
            animate:
                true, // with just animate set to true, default curve = Curves.easeIn
            curve: Curves
                .bounceInOut, // animate must be set to true when using custom curve
            onToggle: (index) {
              imageProvider.cameraSelectPicture = index == 0 ? false : true;
              print(imageProvider.cameraSelectPicture);
            },
          )
        : Container();
  }
}
