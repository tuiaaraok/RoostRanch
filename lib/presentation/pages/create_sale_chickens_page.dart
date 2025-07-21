import 'package:chickenman/core/drift/tables.dart';
import 'package:chickenman/core/injectable/injectable.dart';
import 'package:chickenman/data_sources/chicken_data_source.dart';
import 'package:chickenman/presentation/widgets/btn_widget.dart';

import 'package:keyboard_actions/keyboard_actions.dart';

import '../widgets/widget.dart';

class CreateSaleChickensPage extends StatefulWidget {
  const CreateSaleChickensPage({super.key});

  @override
  State<CreateSaleChickensPage> createState() => _CreateSaleChickensPageState();
}

class _CreateSaleChickensPageState extends State<CreateSaleChickensPage>
    with WidgetsBindingObserver {
  final ChickenDataSource _dataSource = ChickenDataSource(getIt<AppDatabase>());
  late final TextEditingController _quantityController;
  late final TextEditingController _pricePerPieceController;
  late final FocusNode _pricePerPieceNode;
  late final FocusNode _quantityNode;
  late final FormFieldConfig _quantityConfig;
  late final FormFieldConfig _pricePerPieceConfig;
  late Future<List<ChickenData>> namesFuture;
  late MenuElem nameElements;
  int? selectedChickenId;
  double bottomInset = 0;

  bool get isValid =>
      selectedChickenId != null &&
      _quantityController.text.isNotEmpty &&
      _pricePerPieceController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    nameElements = MenuElem(listElements: []);
    _quantityController = TextEditingController();
    _pricePerPieceController = TextEditingController();
    _pricePerPieceNode = FocusNode();
    _quantityNode = FocusNode();

    namesFuture = _dataSource.getChickenNameList();

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
      await _dataSource.addSaleChicken(
        selectedChickenId!,
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
                          FormWidget.textFieldForm(_quantityConfig),
                          SizedBox(height: 12.h),
                          FormWidget.textFieldIcon(_pricePerPieceConfig),
                          SizedBox(height: 12.h),

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
