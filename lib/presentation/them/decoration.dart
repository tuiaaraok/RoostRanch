import 'them.dart';

BoxDecoration get textFieldDecoration => BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(12.r)),
  border: Border.all(color: containerBorderColor, width: 2.w),
  color: containerTextField,
);
BoxDecoration createBtnDecoration(bool isValid) => BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(60.r)),
  border: Border.all(color: containerBorderColor, width: 2.w),
  color:
      isValid ? containerMainColor : containerMainColor.withValues(alpha: 0.7),
);
BoxDecoration get mainBtnDecoration => BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(60.r)),
  border: Border.all(color: containerBorderColor, width: 2.w),
  color: containerMainColor,
);
BoxDecoration get newInformationColorDecoration => BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(60.r)),
  color: containerNewInformationColor,
);
