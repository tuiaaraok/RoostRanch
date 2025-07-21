import 'package:chickenman/data_sources/chicken_data_source.dart';
import 'package:chickenman/core/drift/tables.dart';
import 'package:chickenman/core/injectable/injectable.dart';
import 'package:chickenman/model/chicken_model.dart';
import 'package:chickenman/presentation/widgets/btn_widget.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../widgets/widget.dart';

// ignore: must_be_immutable
class CreateChickenPage extends StatefulWidget {
  CreateChickenPage({super.key, this.chickenData});
  ChickenData? chickenData;
  @override
  State<CreateChickenPage> createState() => _CreateChickenPageState();
}

class _CreateChickenPageState extends State<CreateChickenPage>
    with WidgetsBindingObserver {
  final ChickenDataSource _dataSource = ChickenDataSource(getIt<AppDatabase>());
  late final TextEditingController _nameController;
  late final TextEditingController _breedController;
  late final TextEditingController _dateController;
  late final TextEditingController _weightController;
  late final TextEditingController _eggProductionController;
  late final FocusNode _pricePerPieceNode;
  late final FocusNode _eggProductionNode;

  late final FormFieldConfig _nameFieldConfig;
  late final FormFieldConfig _pricePerPieceConfig;
  late final FormFieldConfig _weightConfig;
  late final FormFieldConfig _datePieceConfig;

  late final FormFieldConfig _eggProductionConfig;

  TextEditingController myController = TextEditingController();
  MenuElem membersElem = MenuElem(
    isOpen: false,
    selectedElem: "",
    listElements: ["Expenses", "Income"],
  );
  double bottomInset = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _nameController = TextEditingController();
    _breedController = TextEditingController();
    _dateController = TextEditingController();
    _weightController = TextEditingController();
    _eggProductionController = TextEditingController();
    _pricePerPieceNode = FocusNode();
    _eggProductionNode = FocusNode();
    if (widget.chickenData != null) {
      _nameController.text = widget.chickenData!.name;
      _breedController.text = widget.chickenData!.breed;
      _dateController.text = DateFormat(
        "dd/MM/yyyy",
      ).format(widget.chickenData!.dateOfBirth);
      _weightController.text = widget.chickenData!.weight.toString();
      _eggProductionController.text =
          widget.chickenData!.eggProduction.toString();
    }
    _nameFieldConfig = FormFieldConfig(
      title: 'Name/No.',
      controller: _nameController,
    );

    _pricePerPieceConfig = FormFieldConfig(
      title: 'Breed',
      controller: _breedController,
    );
    _datePieceConfig = FormFieldConfig(
      title: 'Date of birth',
      controller: _dateController,
      keyboardType: TextInputType.datetime,
      inputFormat: [MaskTextInputFormatter(mask: "##/##/####")],
    );
    _weightConfig = FormFieldConfig(
      title: 'Weight',
      controller: _weightController,
      focusNode: _pricePerPieceNode,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
    _eggProductionConfig = FormFieldConfig(
      title: 'Egg production',
      controller: _eggProductionController,
      focusNode: _eggProductionNode,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }

  bool get isValid =>
      _nameController.text.isNotEmpty &&
      _breedController.text.isNotEmpty &&
      _dateController.text.isNotEmpty &&
      _weightController.text.isNotEmpty &&
      _eggProductionController.text.isNotEmpty;
  @override
  void didChangeMetrics() {
    // Обновляем значение bottomInset при изменении метрик (например, при открытии клавиатуры)
    setState(() {
      bottomInset = MediaQuery.of(context).viewInsets.bottom;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _pricePerPieceNode.dispose();
    _eggProductionNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
        child: LayoutBuilder(
          builder: (context, constraint) {
            return KeyboardActions(
              config: KeyboardActionsConfig(
                keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
                nextFocus: false,
                actions: [
                  KeyboardActionsItem(focusNode: _pricePerPieceNode),
                  KeyboardActionsItem(focusNode: _eggProductionNode),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraint.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          AppBarWidget(title: "Add chicken "),
                          SizedBox(height: 30.h),
                          FormWidget.textFieldForm(_nameFieldConfig),
                          FormWidget.textFieldForm(_pricePerPieceConfig),
                          FormWidget.textFieldForm(_datePieceConfig),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, bottom: 26.h),
                            child: Text(
                              "Initial indicators",
                              style: textStyleInformation,
                            ),
                          ),
                          FormWidget.textFieldForm(_weightConfig),
                          FormWidget.textFieldForm(_eggProductionConfig),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.paddingOf(context).bottom,
                              top: bottomInset,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                if (isValid) {
                                  if (widget.chickenData != null) {
                                    final updatedChicken = widget.chickenData!
                                        .copyWith(
                                          name: _nameController.text,
                                          breed: _breedController.text,
                                          dateOfBirth: DateFormat(
                                            'dd/MM/yyyy',
                                          ).parse(_dateController.text),
                                          eggProduction:
                                              double.tryParse(
                                                _eggProductionController.text
                                                    .replaceAll(',', '.'),
                                              ) ??
                                              0.0,
                                          weight:
                                              double.tryParse(
                                                _weightController.text
                                                    .replaceAll(',', '.'),
                                              ) ??
                                              0.0,
                                        );
                                    _dataSource.updateChicken(updatedChicken);
                                  } else {
                                    _dataSource.addChicken(
                                      chicken: ChickenModel(
                                        name: _nameController.text,
                                        breed: _breedController.text,
                                        dateOfBirth: DateFormat(
                                          'dd/MM/yyyy',
                                        ).parse(_dateController.text),
                                        eggProduction:
                                            double.tryParse(
                                              _eggProductionController.text
                                                  .replaceAll(',', '.'),
                                            ) ??
                                            0.0,
                                        weight:
                                            double.tryParse(
                                              _weightController.text.replaceAll(
                                                ',',
                                                '.',
                                              ),
                                            ) ??
                                            0.0,
                                      ),
                                    );
                                  }
                                }
                                Navigator.pop(context);
                              },
                              child: CreateBtnWidget(isValid: isValid),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
