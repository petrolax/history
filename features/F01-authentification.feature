# language: ru

@javascript
Функция: F01 Аутентификация

	Сценарий: Я, как гость, могу читать информацию без ограничений без регистрации.

		Дано я гость
		Когда я открываю главную страницу
		Затем вижу текст "История зданий"

	@pending
	Сценарий: Я, как гость, могу зарегистрироваться в системе, чтобы стать пользователем 

		Дано я гость
		Когда я открываю главную страницу
		И нажимаю на кнопку "Логин"
		И нажимаю на кнопку "Регистрация"
		И заполняю поле "Электронная почта" со значением "new.user@example.com"
		И заполняю поле "Пароль" со значением "secret123"
    И заполняю поле "Подтверждение пароля" со значением "secret123"
		Затем вижу текст "Вход в систему как Новый Пользователь"