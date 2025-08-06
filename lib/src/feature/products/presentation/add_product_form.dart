import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:box_app/src/constants/app_colors.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

final _addProductKey = GlobalKey<FormBuilderState>();
List<String> categoryOptions = ['Category1', 'Category2'];

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  final double _minWidth = 400.0;
  final double _spacing = 120.0;
  final double _runSpacing = 10.0;
  final String formTitle = 'Add Product';

  void cancelForm() {
    debugPrint('Form cancelled');
  }

  void submitForm() {
    debugPrint('Form submit');
    _addProductKey.currentState?.saveAndValidate();
    debugPrint(_addProductKey.currentState?.value.toString());

    // can access all field values without saving form with instantValues
    _addProductKey.currentState?.validate();
    debugPrint(_addProductKey.currentState?.instantValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Forms'))),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          // width: MediaQuery.of(context).size.width * 0.7,
          // margin: EdgeInsets.all(16.0),
          // decoration: BoxDecoration(
          //   color: AppColors.whiteSmoke,
          //   border: Border.all(color: AppColors.grey),
          //   borderRadius: BorderRadius.circular(10.0), // Rounded corners
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.grey.withValues(alpha: 0.5),
          //       spreadRadius: 2,
          //       blurRadius: 7,
          //       offset: Offset(0, 3), // changes position of shadow
          //     ),
          //   ],
          // ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FormBuilder(
                  key: _addProductKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                        child: Text(
                          formTitle,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          runSpacing: _runSpacing,
                          spacing: _spacing,
                          children: [
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                name: 'Product name',
                                decoration: const InputDecoration(
                                  labelText: 'Product name',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                name: 'Brand',
                                decoration: const InputDecoration(
                                  labelText: 'Brand',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                name: 'Model',
                                decoration: const InputDecoration(
                                  labelText: 'Model',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                name: 'Price',
                                decoration: const InputDecoration(
                                  labelText: 'Price',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                name: 'description',
                                decoration: InputDecoration(
                                  labelText: 'Description',
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.maxLength(200),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderDropdown<String>(
                                name: 'Category',
                                initialValue: 'Category1',
                                decoration: InputDecoration(
                                  labelText: 'Category',
                                  hintText: 'Category',
                                  border: OutlineInputBorder(),
                                ),
                                items: categoryOptions
                                    .map(
                                      (option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            // SizedBox(width: _minWidth, height: 0),
                            SizedBox(
                              width: _minWidth,
                              child: FormBuilderTextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                name: 'Stock Quantitiy',
                                keyboardType: TextInputType.numberWithOptions(),
                                decoration: const InputDecoration(
                                  labelText: 'Stock Quantity',
                                  border: OutlineInputBorder(),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.min(1),
                                  FormBuilderValidators.max(200),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          runSpacing: _runSpacing,
                          spacing: _spacing,
                          children: [
                            SizedBox(
                              width: _minWidth,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(_minWidth, 60),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    // side: BorderSide(color: Colors.grey),
                                  ),
                                  // backgroundColor: Colors.white70,
                                  foregroundColor: Colors.black45,
                                ),
                                onPressed: () => cancelForm(),
                                child: Text('Cancel'),
                              ),
                            ),
                            SizedBox(
                              width: _minWidth,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(_minWidth, 60),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: Colors.green,
                                  foregroundColor: AppColors.white,
                                ),
                                onPressed: () => submitForm(),
                                child: Text('Save'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
