import 'them.dart'; // или напрямую my_color.dart, если нужны цвета

TextStyle get textStyleField => GoogleFonts.lato(
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
  color: textFieldColor,
);
TextStyle get textStyleFieldHint => GoogleFonts.lato(
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
  color: hintColor,
);
TextStyle get textStyleFieldTitle => GoogleFonts.lato(
  fontSize: 20.sp,
  fontWeight: FontWeight.w500,
  color: textFieldColor,
);
TextStyle get textStyleInformation => GoogleFonts.lato(
  fontSize: 22.sp,
  fontWeight: FontWeight.w800,
  color: textInformationColor,
);
TextStyle get textStyleAppBar => GoogleFonts.lato(
  fontSize: 32.sp,
  fontWeight: FontWeight.w800,
  color: textAppBarColor,
);

TextStyle get textStyleMainCard => GoogleFonts.lato(
  fontSize: 18.sp,
  fontWeight: FontWeight.w400,
  color: textMainCardColor,
);

TextStyle get textStyleNewInformatioCard => GoogleFonts.lato(
  fontSize: 18.sp,
  fontWeight: FontWeight.w800,
  color: textNewInformationColor,
);
TextStyle get textStyleCreateBtn => GoogleFonts.lato(
  fontSize: 26.sp,
  fontWeight: FontWeight.w800,
  color: textCreateBtnColor,
);
