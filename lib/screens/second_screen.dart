import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamyogya_flutter_intern_task/data/models/members_model.dart';
import 'package:kamyogya_flutter_intern_task/main.dart';
import 'package:kamyogya_flutter_intern_task/screens/bloc/data_display_bloc.dart';

class SecondScreen extends StatefulWidget {
  final List<MembersModel>? members;
  const SecondScreen({super.key, required this.members});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => DataDisplayBloc()
        ..add(
          LoadMembersDataEvent(
            membersDetails: widget.members!,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<DataDisplayBloc, DataDisplayState>(
          builder: (context, state) {
            if (state is DataDisplayInProgress) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: ListView.builder(
                  itemCount: state.members.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.members[index].name ?? "Name"),
                      subtitle: Text(state.members[index].club ?? "Club"),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          state.members[index].image!,
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
