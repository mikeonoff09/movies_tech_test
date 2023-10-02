import 'package:flutter/material.dart';
import 'package:movies_tech_test/presentation/bloc/home_bloc.dart';

void homeBlocListener(BuildContext context, state) {
  switch (state) {
    case BooksFetchedState():
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Books Fetched"),
        ),
      );
    case FetchingBooksState():
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Fetching Books"),
        ),
      );
    case ErrorFetchingBooksState():
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error Fetching Books"),
        ),
      );
    case ErrorSearchingBooksState():
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error Searching Books"),
        ),
      );
    default:
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Default switch case"),
        ),
      );
  }
}
