part of 'deserts_cubit.dart';

abstract class DesertsState extends Equatable {
  const DesertsState();

  @override
  List<String> get props => [];
}

class DesertsInitial extends DesertsState{
  const DesertsInitial();
}

class DesertsLoading extends DesertsState{
  const DesertsLoading();
}

class DesertsAdd extends DesertsState{
  const DesertsAdd();
}

class DesertsEdit extends DesertsState{
  const DesertsEdit();
}