import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sai_weather/core/core.dart';
import '../../../../data/data.dart';

part 'search_city_event.dart';
part 'search_city_state.dart';

class SearchCityBloc extends Bloc<SearchCityEvent, SearchCityState> {
  final ICityRepo cityRepo;
  SearchCityBloc(this.cityRepo) : super(SearchCityInitial()) {
    on<RunSearchCity>((event, emit) async {
      ///
      ///for checking of city name available
      if (event.cityName.length < 3) {
        emit(SearchCityWarning());
        return;
      }

      emit(SearchCityLoading());

      ///for validated success
      final data = await cityRepo.searchCity(cityName: event.cityName);
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
        emit(SearchCityError(error: errMessage));
      }, (cityList) {
        if (cityList.isEmpty) {
          //for noData state
          emit(SearchCityNoData());
        } else {
          //for data state
          emit(SearchCityData(cityList));
        }
      });
    });
  }
}
