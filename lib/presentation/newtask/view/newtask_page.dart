import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_event.dart';
import 'package:flutter_travel_ui/presentation/home/bloc/home_state.dart';
import 'package:flutter_travel_ui/presentation/newtask/bloc/newtask_cubit.dart';
import 'package:flutter_travel_ui/presentation/newtask/bloc/newtask_state.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                _TopicInput(),
                SizedBox(height: 20,),
                _TitleInput(),
                SizedBox(height: 20,),
                _DescriptionInput(),
                TextButton(onPressed: () {
                  context.read<NewTaskCubit>().submit();
                  Navigator.pop(context);
                }, child: Text("Add"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopicInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskCubit, NewTaskState>(
      buildWhen: (previous, current) => previous.topic!=current.topic,
      builder: (context, state) {
        return TextField(
          decoration: InputDecoration(
              hintText: "Input Your Topic",
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
              label: Text("Topic")),
          onChanged: (value) {
            if (value.isNotEmpty) {
              context.read<NewTaskCubit>().topicChanged(value);
            }
          },
        );
      },
    );
  }
}
class _TitleInput extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return BlocBuilder<NewTaskCubit, NewTaskState>(
    buildWhen: (previous, current) => previous.title!=current.title,
    builder: (context, state) {
      return TextField(
        decoration: InputDecoration(
            hintText: "Input Your Topic",
            hintStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(),
            label: Text("Title")),
        onChanged: (value) {
          if (value.isNotEmpty) {
            context.read<NewTaskCubit>().titleChanged(value);
          }
        },
      );
    },
  );
}
}
class _DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskCubit, NewTaskState>(
      buildWhen: (previous, current) => previous.description!=current.description,
      builder: (context, state) {
        return TextField(
          decoration: InputDecoration(
              hintText: "Input Your Topic",
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
              label: Text("Description")),
          onChanged: (value) {
            if (value.isNotEmpty) {
              context.read<NewTaskCubit>().descriptionChanged(value);
            }
          },
        );
      },
    );
  }
}
