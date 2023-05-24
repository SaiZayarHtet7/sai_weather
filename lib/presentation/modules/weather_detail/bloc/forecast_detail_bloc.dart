import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sai_weather/data/data.dart';

import '../../../../core/core.dart';

part 'forecast_detail_event.dart';
part 'forecast_detail_state.dart';

class ForecastDetailBloc
    extends Bloc<ForecastDetailEvent, ForecastDetailState> {
  final ICityRepo cityRepo;
  ForecastDetailBloc(this.cityRepo) : super(ForecastDetailInitial()) {
    on<GetForecastDetail>((event, emit) async {
      emit(ForecastDetailLoading());
      final data = await cityRepo.getForeCast(cityModel: event.cityModel);
      data.fold((error) {
        ///for error message
        String errMessage = "";
        if (error is ServerFailure) {
          errMessage = StringUtils.somethingWentWrong;
        } else if (error is ConnectionFailure) {
          errMessage = StringUtils.poorConnection;
        } else if (error is LogicFailure) {
          errMessage = error.error;
        } else {
          errMessage = StringUtils.errorFound;
        }
        emit(ForecastDetailError(errMessage));
      }, (forecast) {
        emit(ForecastDetailData(forecast));
      });
    });
  }
}
