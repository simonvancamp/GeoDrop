// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// abstract class ExampleState extends Equatable {
//   const ExampleState();
// }

// class LoadingState extends ExampleState {
//   //
// }

// class LoadedState extends ExampleState {
//   //
// }

// class FailedState extends ExampleState {
//   //
// }

// abstract class ExampleEvent extends Equatable {
//   //
// }

// class SubscribeEvent extends ExampleEvent {
//   //
// }

// class UnsubscribeEvent extends ExampleEvent {
//   //
// }

// class FetchEvent extends ExampleEvent {
//   //
// }

// class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
//   @override
//   ExampleState get initialState => LoadingState();

//   @override
//   Stream<ExampleState> mapEventToState(
//     ExampleEvent event,
//   ) async* {
//     if (event is SubscribeEvent) {
//       //
//     } else if (event is UnsubscribeEvent) {
//       //
//     } else if (event is FetchEvent) {
//       yield LoadingState();
//       try {
//         // network calls
//         yield LoadedState();
//       } catch (_) {
//         yield FailedState();
//       }
//     }
//   }
// }
