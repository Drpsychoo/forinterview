import 'package:flutter/material.dart';

class CustomNavBarItemCard<T> extends StatefulWidget {
  final T value;
  final T groupValue;

  final ValueChanged<T?> onChanged;
  final String text;
  final Widget child;
  final Widget secondChild;

  const CustomNavBarItemCard({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.child,
    required this.text,
    required this.secondChild,
  }) : super(key: key);

  @override
  State<CustomNavBarItemCard<T>> createState() =>
      _CustomNavBarItemCardState<T>();
}

class _CustomNavBarItemCardState<T> extends State<CustomNavBarItemCard<T>> {
  @override
  Widget build(BuildContext context) {
    return _customRadioButton;
  }

  Widget get _customRadioButton {
    final isSelected = widget.value == widget.groupValue;
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () {
            widget.onChanged(widget.value);
            // print(isSelected);
          },
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected
                  ? Colors.lightBlue
                  : const Color.fromARGB(0, 255, 255, 255),
            ),
            width: isSelected ? 100 : 40,
            height: isSelected ? 40 : 40,
            duration: const Duration(milliseconds: 200),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isSelected ? 7 : 0,
                    ),
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: widget.child,
                      secondChild: Container(
                        // color: Colors.amber,
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: widget.secondChild,
                      ),
                      crossFadeState: isSelected
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: isSelected,
                      // height: 30,
                      child: SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.text,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.blue
                                  : const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Icon(
                  //   trailing,
                  //   color: isSelected ? Colors.orangeAccent : Colors.grey[300]!,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
