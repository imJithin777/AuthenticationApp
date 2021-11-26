import 'package:flutter/material.dart';


class CommonsizedButton extends StatefulWidget {
  final void Function()? onPressed;
  final bool isborderbutton;
  final Widget? child;
  final double? height;
  final double? width;
  final double? radius;
  final Color? primarycolor;
  final Color? bordercolor;
  final String? title;
  final String? imagename;
  final double? image_height;
  final double? image_width;
  final double? elevation;
  final bool? istext;
  final BoxFit? boxFit;
  final TextStyle? style;
  CommonsizedButton({this.onPressed,this.bordercolor,required this.isborderbutton,this.child,this.height,this.width,this.radius,this.primarycolor,this.elevation,@required this.istext,this.title,this.imagename,this.image_height,this.image_width,this.boxFit,this.style});

  @override
  _CommonsizedButtonState createState() => _CommonsizedButtonState();
}


class _CommonsizedButtonState extends State<CommonsizedButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: widget.isborderbutton
        ? TextButton(
          child: widget.istext! ?  Text("${widget.title}",style: widget.style
          ) : Image.asset('${widget.imagename}',height: widget.image_height,width: widget.image_width,fit: widget.boxFit,),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(widget.primarycolor!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(widget.radius!),
                      side: BorderSide(color: widget.primarycolor!)
                  )
              )
          ),
          onPressed: widget.onPressed,
      )
        : ElevatedButton(
          style:  ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular(widget.radius!),
              ),
              primary: widget.primarycolor,
              elevation: widget.elevation,
          ),
          onPressed: widget.onPressed,
          child: widget.istext! ?  Text("${widget.title}",style: widget.style
      ) : Image.asset('${widget.imagename}',height: widget.image_height,width: widget.image_width,fit: widget.boxFit,))
    );
  }
}