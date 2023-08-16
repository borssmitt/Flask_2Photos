# Указываем базовый образ, содержащий Python и Nginx
FROM python:3.9-slim

# Обновляем пакеты в базовом образе и устанавливаем Nginx
RUN apt-get update && apt-get install -y nginx

# Устанавливаем Flask и Gunicorn (веб-сервер для запуска Flask-приложения)
RUN pip install Flask gunicorn

# Создаем рабочую директорию для приложения
WORKDIR /app

# Копируем файлы приложения в контейнер
COPY app /app
COPY nginx.conf /etc/nginx/sites-available/default

# Устанавливаем переменные окружения для Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Запускаем приложение при старте контейнера через Gunicorn
CMD ["gunicorn", "app:app"]
