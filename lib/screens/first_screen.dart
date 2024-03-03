import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kamyogya_flutter_intern_task/bloc/members_bloc.dart';
import 'package:kamyogya_flutter_intern_task/data/repository/api_repository.dart';
import 'package:kamyogya_flutter_intern_task/main.dart';
import 'package:kamyogya_flutter_intern_task/routes/app_route_names.dart';
import 'package:kamyogya_flutter_intern_task/utils/show_snackbar.dart';
import 'package:kamyogya_flutter_intern_task/widgets/custom_button.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final String apiEndPoint =
      dotenv.env["API_END_POINT"] ?? "Failed to load environment variable";
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => MembersBloc(
        apiRepository: RepositoryProvider.of<ApiRepository>(context),
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<MembersBloc, MembersState>(
          builder: (context, state) {
            if (state is MembersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MembersInitial) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            apiEndPoint,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        CustomButton(
                          onPressed: () {
                            FlutterClipboard.copy(apiEndPoint).then(
                              (value) {
                                showSnackBar(
                                  message: "API end point copied",
                                  context: context,
                                );
                              },
                            );
                          },
                          minWidth: size.width * 0.2,
                          buttonName: "Copy",
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Form(
                      key: _globalKey,
                      child: TextFormField(
                        controller: _textFieldController,
                        validator: (value) =>
                            value!.isEmpty ? "This field is required" : null,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CustomButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          context.read<MembersBloc>().add(
                                MembersLoadEvent(
                                  endPoint: _textFieldController.text,
                                ),
                              );
                        }
                      },
                      minWidth: size.width,
                      buttonName: "Done",
                    )
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
          listener: (context, state) {
            if (state is MembersLoadedState) {
              GoRouter.of(context).pushReplacementNamed(
                AppRouteNames.secondPage,
                extra: state.members,
              );
            } else if (state is MembersErrorState) {
              showSnackBar(
                message: state.message,
                context: context,
              );
              _textFieldController.clear();
            }
          },
        ),
      ),
    );
  }
}
