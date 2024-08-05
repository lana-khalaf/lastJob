import 'package:equatable/equatable.dart';
import 'package:flutter_jobs_app/Model/cv.model.dart';


abstract class CVState extends Equatable {
  const CVState();

  @override
  List<Object> get props => [];
}

class CVInitial extends CVState {}

class CVLoading extends CVState {}

class CVSuccess extends CVState {
  final List<CV> cvs;

  const CVSuccess({required this.cvs});

  @override
  List<Object> get props => [cvs];
}

class CVError extends CVState {}
