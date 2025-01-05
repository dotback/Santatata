// lib/features/video_generation/widgets/prompt_input_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PromptInputCard extends HookWidget {
  final String prompt;
  final Function(String) onPromptChanged;

  const PromptInputCard({
    super.key,
    required this.prompt,
    required this.onPromptChanged,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: prompt);

    useEffect(() {
      controller.text = prompt;
      return null;
    }, [prompt]);

    return TextField(
      controller: controller,
      onChanged: onPromptChanged,
      maxLines: 5,
      maxLength: 2000,
      decoration: InputDecoration(
        hintText: 'テキストを入力',
        hintStyle: TextStyle(color: Colors.grey.shade600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade800,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade800,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        filled: true,
        fillColor: Colors.grey.shade900,
      ),
    );
  }
}
