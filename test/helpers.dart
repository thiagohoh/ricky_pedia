import 'package:flutter/material.dart';
import 'package:ricky_pedia/components/full_card.dart';

bool fullCardMatcher(Widget widget, String title) {
  if (widget is FullCard) {
    return widget.title == title;
  }
  return false;
}
