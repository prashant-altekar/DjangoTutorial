python3 -m venv fresh_django
cd fresh_django
bin/activate
python -m pip install Django
git clone --depth=20 https://github.com/prashant-altekar/DjangoTutorial.git
cd DjangoTutorial
python manage.py sqlmigrate polls 0001
python manage.py migrate
DjangoTutorial % export DJANGO_SUPERUSER_PASSWORD=admin && python manage.py createsuperuser --username admin --email prashant_altekar@hotmail.com --noinput
cat setup.py | python manage.py shell
python manage.py runserver
