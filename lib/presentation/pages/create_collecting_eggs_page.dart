import 'package:chickenman/core/injectable/injectable.dart';
import 'package:chickenman/data_sources/chicken_data_source.dart';
import 'package:chickenman/presentation/widgets/btn_widget.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../core/drift/tables.dart';
import '../widgets/widget.dart';

class CreateCollectingEggsPage extends StatefulWidget {
  const CreateCollectingEggsPage({super.key});

  @override
  State<CreateCollectingEggsPage> createState() =>
      _CreateCollectingEggsPageState();
}

class _CreateCollectingEggsPageState extends State<CreateCollectingEggsPage>
    with WidgetsBindingObserver {
  final ChickenDataSource _dataSource = ChickenDataSource(getIt<AppDatabase>());

  late final TextEditingController _eggVarietyController;
  late final TextEditingController _quantityController;
  late final TextEditingController _pricePerPieceController;
  late final FocusNode _pricePerPieceNode;
  late final FocusNode _quantityNode;
  late final FormFieldConfig _quantityConfig;
  late final FormFieldConfig _pricePerPieceConfig;

  late MenuElem nameElements;
  late MenuElem eggVarietyElements;
  double bottomInset = 0;
  late Future<List<ChickenData>> namesFuture;
  late Future<List<EggVarietyData>> eggVarietyFuture;
  int? selectedChickenId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _eggVarietyController = TextEditingController();
    _quantityController = TextEditingController();
    _pricePerPieceController = TextEditingController();
    _pricePerPieceNode = FocusNode();
    _quantityNode = FocusNode();

    nameElements = MenuElem(listElements: []);
    eggVarietyElements = MenuElem(listElements: []);

    _quantityConfig = FormFieldConfig(
      title: 'Quantity',
      hint: "Specify quantity",
      controller: _quantityController,
      keyboardType: TextInputType.number,
      focusNode: _quantityNode,
    );

    _pricePerPieceConfig = FormFieldConfig(
      title: 'Price per piece',
      controller: _pricePerPieceController,
      hint: "Enter the cost",
      icon: Text("\$", style: textStyleField),
      keyboardType: TextInputType.number,
      focusNode: _pricePerPieceNode,
    );

    // Initialize futures
    namesFuture = _dataSource.getChickenNameList();
    eggVarietyFuture = _dataSource.getEggVarietyList();

    // Add listeners to update UI when text changes
    _quantityController.addListener(_updateTotal);
    _pricePerPieceController.addListener(_updateTotal);
  }

  void _updateTotal() {
    if (mounted) {
      setState(() {});
    }
  }

  bool get isValid =>
      _eggVarietyController.text.isNotEmpty &&
      _quantityController.text.isNotEmpty &&
      _pricePerPieceController.text.isNotEmpty;

  @override
  void didChangeMetrics() {
    // Update bottom inset when metrics change (e.g., keyboard opens)
    if (mounted) {
      setState(() {
        bottomInset = MediaQuery.of(context).viewInsets.bottom;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _eggVarietyController.dispose();
    _quantityController.dispose();
    _pricePerPieceController.dispose();
    _pricePerPieceNode.dispose();
    _quantityNode.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!isValid) return;

    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final pricePerPiece = int.tryParse(_pricePerPieceController.text) ?? 0;

    // Find the selected egg variety
    final eggVarieties = await eggVarietyFuture;
    EggVarietyData selectedVariety;

    try {
      selectedVariety = eggVarieties.firstWhere(
        (variety) => variety.name == _eggVarietyController.text,
      );
    } catch (e) {
      // If variety doesn't exist, create it
      final newVarietyId = await _dataSource.addEggVariety(
        _eggVarietyController.text,
      );
      selectedVariety = EggVarietyData(
        id: newVarietyId,
        name: _eggVarietyController.text,
      );
    }

    await _dataSource.addCollectingEggs(
      selectedChickenId!,
      selectedVariety.id,
      quantity,
      pricePerPiece,
    );

    if (mounted) {
      Navigator.pop(context);
    }
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
                  KeyboardActionsItem(focusNode: _quantityNode),
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
                          AppBarWidget(title: "Collecting eggs"),
                          SizedBox(height: 30.h),

                          // Chicken name dropdown
                          FutureBuilder<List<ChickenData>>(
                            future: namesFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }

                              if (snapshot.hasError || !snapshot.hasData) {
                                return Text('Error loading chicken names');
                              }
                              final chickens = snapshot.data!;
                              nameElements = MenuElem(
                                listElements:
                                    chickens.map((c) => c.name).toList(),
                                selectedElem: nameElements.selectedElem,
                              );
                              return DropMenuWidget(
                                title: 'Name/No.',
                                menu: nameElements,
                                hint: 'Choose a chicken',
                                onChanged: (value) {
                                  final selectedChicken = chickens.firstWhere(
                                    (c) => c.name == value,
                                    orElse:
                                        () =>
                                            throw Exception(
                                              'Chicken not found',
                                            ),
                                  );

                                  nameElements.selectedElem = value;
                                  selectedChickenId = selectedChicken.id;
                                },
                              );
                            },
                          ),
                          SizedBox(height: 12.h),

                          // Egg variety dropdown
                          FutureBuilder<List<EggVarietyData>>(
                            future: eggVarietyFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }

                              if (snapshot.hasError || !snapshot.hasData) {
                                return Text('Error loading chicken names');
                              }
                              final chickens = snapshot.data!;
                              eggVarietyElements = MenuElem(
                                listElements:
                                    chickens.map((c) => c.name).toList(),
                                selectedElem: eggVarietyElements.selectedElem,
                              );
                              return DropMenuWidget(
                                title: 'Egg variety',
                                menu: eggVarietyElements,
                                hint: 'Select variety',
                                controller: _eggVarietyController,
                                onChanged: (value) {
                                  setState(() {
                                    _eggVarietyController.text = value;
                                  });
                                },
                              );
                            },
                          ),
                          SizedBox(height: 12.h),

                          FormWidget.textFieldForm(_quantityConfig),
                          SizedBox(height: 12.h),
                          FormWidget.textFieldIcon(_pricePerPieceConfig),

                          Padding(
                            padding: EdgeInsets.only(top: 100.h),
                            child: Text(
                              "Total: ${_quantityController.text} eggs / Amount: ${((int.tryParse(_quantityController.text) ?? 0) * (int.tryParse(_pricePerPieceController.text) ?? 0))} \$",
                              style: textStyleInformation,
                            ),
                          ),

                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.paddingOf(context).bottom,
                              top: bottomInset,
                            ),
                            child: GestureDetector(
                              onTap: _submitForm,
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
