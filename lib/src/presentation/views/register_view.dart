import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nearby_text/src/config/router.dart';
import 'package:nearby_text/src/domain/models/user_data/user_data.dart';
import 'package:nearby_text/src/presentation/cubits/register_cubit.dart';
import 'package:nearby_text/src/presentation/widgets/nt_text_form_field.dart';
import 'package:nearby_text/src/utils/extensions/date_time_extensions.dart';
import 'package:nearby_text/src/utils/extensions/double_extension.dart';

import '../../utils/constants/images.dart';
import 'chat_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final focusNode = FocusNode();
    return Scaffold(
      // backgroundColor: Colors.white,
      body: BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, UserData?>(
          listener: (context, userdata) async {
            if (userdata?.showDateSnackBar == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please select DOB'),
                  duration: const Duration(seconds: 1),
                  backgroundColor: Colors.redAccent,
                ),
              );
              await Future.delayed(const Duration(seconds: 1));
              if (context.mounted) {
                context.read<RegisterCubit>().update(showDateSnackBar: false);
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: context.read<RegisterCubit>().formKey,
              child: SingleChildScrollView(
                child: SizedBox(
                  height:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      kToolbarHeight / 2,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color:
                              MediaQuery.of(context).platformBrightness ==
                                      Brightness.dark
                                  ? Theme.of(context).cardColor
                                  : null,
                        ),
                        child: SvgPicture.asset(
                          height: MediaQuery.of(context).size.width - 40,
                          ImagePaths.svgLogo,
                          colorFilter:
                              MediaQuery.of(context).platformBrightness ==
                                      Brightness.light
                                  ? null
                                  : ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                        ),
                      ),
                      10.0.height,
                      ClipPath(
                        clipper: CustomShapeClipper(),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 20, 15),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            // borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Text(
                            'Nearby Text',
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // : Image.asset(ImagePaths.logo),
                      NtTextFormField(
                        hintText: 'Name',
                        focusNode: focusNode,
                        controller: nameController,
                        onChanged:
                            (_) =>
                                context
                                    .read<RegisterCubit>()
                                    .formKey
                                    .currentState
                                    ?.validate(),
                      ),
                      GestureDetector(
                        onTap: () async {
                          focusNode.unfocus();
                          DateTime? date = await showDatePickerDialog(
                            context: context,
                            minDate: DateTime(1900),
                            maxDate: DateTime.now().subtract(
                              Duration(days: 365 * 18),
                            ),
                            height: 250,
                          );
                          if (context.mounted) {
                            context.read<RegisterCubit>().update(dob: date);
                          }
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            // border: Border.all(color: Theme.of(context).cardColor),
                          ),
                          child: Text(
                            state?.dob?.ddMmmmYYYY ?? 'Date of birth',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (FocusScope.of(context).hasFocus) {
                            FocusScope.of(context).unfocus();
                          }
                          if (await context.read<RegisterCubit>().register(
                            nameController.text,
                          )) {
                            if (context.mounted) {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.home);
                            }
                          }
                        },
                        child: Text('Register'),
                      ),
                    ],
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
