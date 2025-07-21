import 'widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class MenuElem {
  final List<String> listElements;
  String selectedElem;
  bool isOpen;

  MenuElem({
    required this.listElements,
    this.selectedElem = '',
    this.isOpen = false,
  });
}

class DropMenuWidget extends StatefulWidget {
  final String title;
  final MenuElem menu;
  final TextEditingController? controller;
  final String hint;
  final double width;
  final double height;
  final bool useCustomDropdown;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  const DropMenuWidget({
    super.key,
    required this.title,
    required this.menu,
    this.controller,
    required this.hint,
    this.width = 332,
    this.height = 51,
    this.useCustomDropdown = false,
    this.focusNode,
    this.keyboardType,
    this.onChanged,
  });

  @override
  State<DropMenuWidget> createState() => _DropMenuWidgetState();
}

class _DropMenuWidgetState extends State<DropMenuWidget> {
  @override
  void initState() {
    super.initState();
    _syncControllerWithMenu();
  }

  @override
  void didUpdateWidget(covariant DropMenuWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.menu.selectedElem != widget.menu.selectedElem) {
      _syncControllerWithMenu();
    }
  }

  void _syncControllerWithMenu() {
    if (widget.controller != null && widget.menu.selectedElem.isNotEmpty) {
      widget.controller!.text = widget.menu.selectedElem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: textStyleField),
        widget.useCustomDropdown
            ? _buildCustomDropdown()
            : _buildDropdownButton2(),
      ],
    );
  }

  Widget _buildDropdownButton2() {
    return SizedBox(
      height: widget.height.h,
      width: widget.width.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: textFieldDecoration,
        child:
            widget.controller == null
                ? _buildDefaultDropdown()
                : _buildDropdownWithTextField(),
      ),
    );
  }

  Widget _buildDefaultDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value:
            widget.menu.selectedElem.isEmpty ? null : widget.menu.selectedElem,
        onChanged: _handleItemSelected,
        onMenuStateChange: _handleMenuStateChange,
        customButton: _buildDropdownContent2(),
        items: _buildMenuItems(),
        dropdownStyleData: _dropdownStyleData(),
        menuItemStyleData: _menuItemStyleData(),
      ),
    );
  }

  Widget _buildDropdownWithTextField() {
    return Row(
      children: [Expanded(child: _buildTextField()), _buildDropdownToggle()],
    );
  }

  Widget _buildTextField() {
    return TextField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: widget.hint,
        hintStyle: textStyleFieldHint,
      ),
      keyboardType: widget.keyboardType,
      cursorColor: Colors.black,
      style: textStyleField,
      onChanged: widget.onChanged,
    );
  }

  Widget _buildDropdownToggle() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value:
            widget.menu.selectedElem.isEmpty ? null : widget.menu.selectedElem,
        onChanged: _handleItemSelected,
        onMenuStateChange: _handleMenuStateChange,
        customButton: _buildDropdownToggleButton2(),
        items: _buildMenuItems(),
        dropdownStyleData: _dropdownStyleData(),
        menuItemStyleData: _menuItemStyleData(),
      ),
    );
  }

  Widget _buildCustomDropdown() {
    return SizedBox(
      width: widget.width.w,
      child: Container(
        decoration: textFieldDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: widget.menu.listElements.isEmpty ? 13.h : 0,
          ),
          child:
              widget.menu.isOpen ? _buildExpandedMenu() : _buildCollapsedMenu(),
        ),
      ),
    );
  }

  Widget _buildExpandedMenu() {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.menu.listElements.map(_buildMenuItem).toList(),
        ),
        Positioned(right: 0.w, top: 0.h, child: _buildDropdownToggleButton()),
      ],
    );
  }

  Widget _buildCollapsedMenu() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child:
                widget.controller != null
                    ? _buildTextField()
                    : GestureDetector(
                      onTap: _toggleMenu,
                      child: Text(
                        widget.menu.selectedElem.isEmpty
                            ? widget.hint
                            : widget.menu.selectedElem,
                        style: textStyleField,
                      ),
                    ),
          ),
        ),
        _buildDropdownToggleButton(),
      ],
    );
  }

  Widget _buildDropdownContent2() {
    return Row(
      children: [
        Expanded(
          child:
              widget.controller != null
                  ? _buildTextField()
                  : Text(
                    widget.menu.selectedElem.isEmpty
                        ? widget.hint
                        : widget.menu.selectedElem,
                    style: textStyleField,
                  ),
        ),
        _buildDropdownToggleButton2(),
      ],
    );
  }

  Widget _buildDropdownToggleButton() {
    return IconButton(
      onPressed: _toggleMenu,
      icon: Transform.rotate(
        angle: widget.menu.isOpen ? math.pi : 0,
        child: SvgPicture.asset("assets/icons/arrow-down.svg", width: 24.w),
      ),
    );
  }

  Widget _buildDropdownToggleButton2() {
    return Transform.rotate(
      angle: widget.menu.isOpen ? math.pi : 0,
      child: SvgPicture.asset("assets/icons/arrow-down.svg", width: 24.w),
    );
  }

  Widget _buildMenuItem(String element) {
    return GestureDetector(
      onTap: () => _handleItemSelected(element),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Text(
          element,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }

  void _handleItemSelected(String? value) {
    if (value == null) return;

    setState(() {
      widget.menu
        ..selectedElem = value
        ..isOpen = false;

      if (widget.controller != null) {
        widget.controller!.text = value;
      }
      widget.onChanged?.call(value);
    });
  }

  void _handleMenuStateChange(bool isOpen) =>
      setState(() => widget.menu.isOpen = isOpen);

  void _toggleMenu() =>
      setState(() => widget.menu.isOpen = !widget.menu.isOpen);

  List<DropdownMenuItem<String>> _buildMenuItems() {
    return widget.menu.listElements
        .map(
          (item) => DropdownMenuItem(
            value: item,
            child: SizedBox(
              width: 355.w,
              height: 50.h,
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  DropdownStyleData _dropdownStyleData() {
    return DropdownStyleData(
      width: 361.w,
      maxHeight: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      offset: Offset(-15.w, 0),
    );
  }

  MenuItemStyleData _menuItemStyleData() {
    return MenuItemStyleData(
      customHeights: List.filled(widget.menu.listElements.length, 50.h),
      padding: EdgeInsets.only(top: 5.h, left: 10.w, right: 10.w),
    );
  }
}
