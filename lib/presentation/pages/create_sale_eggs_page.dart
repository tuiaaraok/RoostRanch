import 'package:chickenman/core/drift/tables.dart';
import 'package:chickenman/core/injectable/injectable.dart';
import 'package:chickenman/data_sources/chicken_data_source.dart';
import 'package:chickenman/presentation/widgets/btn_widget.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../widgets/widget.dart';

class CreateSaleEggsPage extends StatefulWidget {
  const CreateSaleEggsPage({super.key});

  @override
  State<CreateSaleEggsPage> createState() => _CreateSaleEggsPageState();
}

class _CreateSaleEggsPageState extends State<CreateSaleEggsPage>
    with WidgetsBindingObserver {
  final ChickenDataSource _dataSource = ChickenDataSource(getIt<AppDatabase>());
  late final TextEditingController _quantityController;
  late final TextEditingController _pricePerPieceController;
  late final FocusNode _pricePerPieceNode;
  late final FocusNode _quantityNode;
  late final FormFieldConfig _quantityConfig;
  late final FormFieldConfig _pricePerPieceConfig;
  late Future<List<EggVarietyData>> eggVarietyFuture;
  late MenuElem eggVarietyElements;
  int? selectedEggVarietyId;
  double bottomInset = 0;

  bool get isValid =>
      selectedEggVarietyId != null &&
      _quantityController.text.isNotEmpty &&
      _pricePerPieceController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    eggVarietyElements = MenuElem(listElements: []);
    _quantityController = TextEditingController();
    _pricePerPieceController = TextEditingController();
    _pricePerPieceNode = FocusNode();
    _quantityNode = FocusNode();

    eggVarietyFuture = _dataSource.getEggVarietyList();

    _quantityConfig = FormFieldConfig(
      title: 'Quantity',
      hint: "Specify quantity",
      controller: _quantityController,
      focusNode: _quantityNode,
      keyboardType: TextInputType.number,
    );

    _pricePerPieceConfig = FormFieldConfig(
      title: 'Price per piece',
      controller: _pricePerPieceController,
      hint: "Enter the cost",
      icon: Text("\$", style: textStyleField),
      keyboardType: TextInputType.number,
      focusNode: _pricePerPieceNode,
    );

    // Add listeners to update the UI when text changes
    _quantityController.addListener(_updateState);
    _pricePerPieceController.addListener(_updateState);
  }

  void _updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeMetrics() {
    // Update bottom inset when metrics change (e.g., keyboard opens)
    if (mounted) {
      setState(() {
        bottomInset = MediaQuery.of(context).viewInsets.bottom;
      });
    }
  }

  Future<void> _submitForm() async {
    if (!isValid) return;

    final quantity = int.tryParse(_quantityController.text) ?? 0;
    final pricePerPiece = int.tryParse(_pricePerPieceController.text) ?? 0;

    try {
      await _dataSource.addSaleEggs(
        selectedEggVarietyId!,
        quantity,
        pricePerPiece,
      );

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving sale: ${e.toString()}')),
        );
      }
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _pricePerPieceController.dispose();
    _pricePerPieceNode.dispose();
    _quantityNode.dispose();
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
                          AppBarWidget(title: "New Sale"),
                          SizedBox(height: 30.h),
                          FutureBuilder<List<EggVarietyData>>(
                            future: eggVarietyFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              if (snapshot.hasError || !snapshot.hasData) {
                                return const Text(
                                  'Error loading egg varieties',
                                );
                              }

                              final varieties = snapshot.data!;
                              eggVarietyElements = MenuElem(
                                listElements:
                                    varieties.map((v) => v.name).toList(),
                                selectedElem: eggVarietyElements.selectedElem,
                              );

                              return DropMenuWidget(
                                title: 'Egg Variety',
                                menu: eggVarietyElements,
                                hint: 'Select variety',
                                onChanged: (value) {
                                  final selectedVariety = varieties.firstWhere(
                                    (v) => v.name == value,
                                    orElse:
                                        () =>
                                            throw Exception(
                                              'Variety not found',
                                            ),
                                  );
                                  setState(() {
                                    selectedEggVarietyId = selectedVariety.id;
                                    eggVarietyElements.selectedElem = value;
                                  });
                                },
                              );
                            },
                          ),
                          SizedBox(height: 12.h),
                          FormWidget.textFieldForm(_quantityConfig),
                          SizedBox(height: 12.h),
                          FormWidget.textFieldIcon(_pricePerPieceConfig),

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
