#Использовать collectionos

Перем _Дети;
Перем _Определение;
Перем _Родитель;
Перем _Имя;
Перем _Поделка;
Перем _Таймаут;
Перем _ЖизненныйЦикл;
Перем _Теги;
Перем _Путь;
Перем _Представление;
Перем _Условия;

Перем ДетиОтсортированы;

Функция Родитель() Экспорт
	Возврат _Родитель;
КонецФункции

Функция Дети() Экспорт

	Если Не ДетиОтсортированы Тогда
		_Дети.Сортировать("Первый, Второй ->
			|	Если Первый.Порядок() > Второй.Порядок() Тогда
			|		Возврат 1;
			|	ИначеЕсли Первый.Порядок() < Второй.Порядок() Тогда
			|		Возврат -1;
			|	Иначе
			|		Возврат 0;
			|	КонецЕсли;
			|"
		);
	КонецЕсли;

	Возврат Новый ФиксированныйСписок(_Дети);

КонецФункции

Функция Теги() Экспорт
	Возврат Новый ФиксированныйСписок(_Теги);
КонецФункции

Функция ТестНабор() Экспорт
	Возврат _Поделка.НайтиЖелудь(_Определение.Ключ);
КонецФункции

Функция Таймаут() Экспорт
	Возврат ?(ЗначениеЗаполнено(_Таймаут), _Таймаут, Родитель().Таймаут());
КонецФункции

Функция Путь() Экспорт
	Возврат _Путь
КонецФункции

Функция Имя() Экспорт
	Возврат _Имя;
КонецФункции

Функция ПолноеИмя() Экспорт
	Возврат Имя();
КонецФункции

Функция Условия() Экспорт
	Возврат Новый ФиксированныйСписок(_Условия);
КонецФункции

Функция ПередВсеми() Экспорт
	Возврат _ЖизненныйЦикл.ПолучитьИлиУмолчание("ПередВсеми", Списки.ИзЭлементов());
КонецФункции

Функция ПередКаждым() Экспорт
	Возврат _ЖизненныйЦикл.ПолучитьИлиУмолчание("ПередКаждым", Списки.ИзЭлементов());
КонецФункции

Функция ПослеВсех() Экспорт
	Возврат _ЖизненныйЦикл.ПолучитьИлиУмолчание("ПослеВсех", Списки.ИзЭлементов());
КонецФункции

Функция ПослеКаждого() Экспорт
	Возврат _ЖизненныйЦикл.ПолучитьИлиУмолчание("ПослеКаждого", Списки.ИзЭлементов());
КонецФункции

Процедура ДобавитьТест(ОпределениеТеста) Экспорт
	ДетиОтсортированы = Ложь;
	_Дети.Добавить(ОпределениеТеста);
КонецПроцедуры

Процедура ОбработкаПолученияПредставления(Представление, СтандартнаяОбработка) // BSLLS:UnusedLocalMethod-off
	СтандартнаяОбработка = Ложь;
	Представление = _Представление;
КонецПроцедуры

&Желудь
&Характер("Компанейский")
Процедура ПриСозданииОбъекта(
	&Пластилин ПутиКТестовымНаборам,
	&Пластилин Поделка,
	&Блестяшка Определение,
	&Блестяшка Родитель,
	&Блестяшка Таймаут,
	&Блестяшка Теги,
	&Блестяшка Условия,
	&Блестяшка ЖизненныйЦикл)

	_Дети              = Новый СписокМассив;
	_Определение       = Определение;
	_Родитель          = Родитель;
	_Поделка           = Поделка;
	_Таймаут           = Таймаут;
	_Теги              = Теги;
	_Условия           = Условия;
	_ЖизненныйЦикл     = ЖизненныйЦикл;
	_Путь              = ПутиКТестовымНаборам.ПолучитьИлиУмолчание(
		Определение.Ключ,
		"Не удалось определить путь к тестовому набору"
	);

	_Имя = СтрЗаменить(Определение.Ключ, "oneunit_testcase_", "");

	_Представление = СтрШаблон(
		"%1 (%2)",
		_Имя,
		_Путь
	);

	ДетиОтсортированы = Истина;

КонецПроцедуры
