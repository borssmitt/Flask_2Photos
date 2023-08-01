from flask import Flask, render_template, request

app = Flask(__name__)

# Глобальная переменная для хранения состояния фото
current_photo = "photo1.jpg"

@app.route('/', methods=['GET', 'POST'])
def index():
    global current_photo

    if request.method == 'POST':
        # Если была отправлена форма, изменяем фото
        current_photo = "photo2.jpg"
    
    return render_template('index.html', photo=current_photo)

if __name__ == '__main__':
    app.run(debug=True)
