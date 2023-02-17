# chmod 400 ~/DjangoInsideVPC-az1.cer 
# ssh -i ~/DjangoInsideVPC-az1.cer ubuntu@18.236.168.0
# git clone --depth=20 https://github.com/prashant-altekar/DjangoTutorial.git
sudo apt update
sudo apt install python3-pip
sudo apt install python3.10-venv
python3 -m venv DjangoTutorial
cd DjangoTutorial/
. bin/activate
python3 -m pip install Django
python3 manage.py sqlmigrate polls 0001
python3 manage.py migrate
export DJANGO_SUPERUSER_PASSWORD=admin && python3 manage.py createsuperuser --username admin --email prashant_altekar@hotmail.com --noinput
cat setup.py | python3 manage.py shell
sudo sh -c ' . bin/activate && python3 manage.py runserver 0.0.0.0:80 '

