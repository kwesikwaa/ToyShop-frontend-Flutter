import 'package:flutter/material.dart';

class CustomerEditWidget extends StatefulWidget {
  
  const CustomerEditWidget({super.key, required this.content, required this.onEditTap, this.maxlines = 1});

  final String content;
  final VoidCallback onEditTap;
  final int maxlines;

  @override
  State<CustomerEditWidget> createState() => _CustomerEditWidgetState();
}

class _CustomerEditWidgetState extends State<CustomerEditWidget> {
  
  bool edit = false;

  _updatefeedback(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: const Row(
          children: [ 
            Icon(Icons.check_circle_outline, color: Colors.white,), 
            SizedBox(width:10),
            Text('Saved', style: TextStyle(color: Colors.white),)]),
        
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextField(
                maxLines: widget.maxlines,enabled: edit,
                decoration: InputDecoration(
                  hintMaxLines: widget.maxlines,
                  hintText: widget.content,
                  isDense: true,
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),),)),
            const SizedBox(width: 5,),
            InkWell(
              onTap: (){
                edit = !edit; 
                edit?null:_updatefeedback();
                setState(() {});}, 
              child: Icon(edit?Icons.save:Icons.edit_square, size: 30, color: Colors.deepPurple,))
          ],
        ),
        const SizedBox(height: 10,),
      ],
    );
  }        
}