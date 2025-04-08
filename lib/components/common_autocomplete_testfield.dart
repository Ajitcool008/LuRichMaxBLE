import 'package:flutter/material.dart';

class CustomAutocompleteTextField extends StatelessWidget {
  final List<String> options;
  final String hintText;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final TextEditingController controller;
  final void Function(String)? onSelected;

  const CustomAutocompleteTextField({
    super.key,
    required this.options,
    required this.controller,
    this.hintText = 'Search or enter manually',
    this.suffixText,
    this.suffixStyle,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return options;
        }
        return options.where((String option) {
          return option.toLowerCase().contains(
            textEditingValue.text.toLowerCase(),
          );
        });
      },
      onSelected: (String selection) {
        controller.text = selection;
        if (onSelected != null) {
          onSelected!(selection);
        }
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController fieldTextEditingController,
        FocusNode fieldFocusNode,
        VoidCallback onFieldSubmitted,
      ) {
        fieldTextEditingController.text = controller.text;

        fieldFocusNode.addListener(() {
          if (fieldFocusNode.hasFocus &&
              fieldTextEditingController.text.isEmpty) {
            fieldTextEditingController.text = '';
          }
        });

        return TextField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          onChanged: (value) => controller.text = value,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            suffixText: suffixText,
            suffixStyle: suffixStyle,
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);
                  return ListTile(
                    title: Text(option),
                    onTap: () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
