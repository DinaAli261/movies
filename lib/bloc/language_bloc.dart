import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/shared_preferences_helper.dart';
import 'language_event.dart';
import 'language_state.dart';

//بياخد event وبيطلع state
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(currentLanguage: "en")) {
    // حمل اخر لغه
    _loadLastLanguage();

    /*emit => function
  بتبعت لكل ال widgets
  اللي هتتاثر انها تعمل set state
  */
    on<ChangeLanguage>((event, emit) async {
      // نتأكد إن اللغة الجديدة مختلفة عن الموجوده
      if (state.currentLanguage != event.newLanguage) {
        // نطلع حالة جديدة بالـ currentLanguage الجديد
        emit(LanguageState(currentLanguage: event.newLanguage));

        // نحفظ اللغة الجديدة في SharedPreferences
        await saveLastLang(event.newLanguage);
      }
    });
  }

  void _loadLastLanguage() async {
    // تحميل آخر لغة محفوظة عند shared preferences
    String lang = await getLastLang();
    //لو اللغه الموجوده مش نفس اللي محفوظه في ال shared preferences
    if (lang != state.currentLanguage) {
      //غير الموجوده ل المحفوظه
      add(ChangeLanguage(lang));
    }
  }
}
