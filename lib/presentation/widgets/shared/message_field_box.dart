import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();

    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color:Colors.transparent),
      borderRadius: BorderRadius.circular(15)
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text;
            textController.clear();
            if(textValue.isNotEmpty)onValue(textValue);
            
          },
        )
      );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      keyboardAppearance: Brightness.dark,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        textController.clear();
        focusNode.requestFocus();
        if(value.isNotEmpty)onValue(value);
      },
    );
  }
}