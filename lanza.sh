killall -9 python
cd /home/andiu/proyectos/colegio
python manage.py runserver&
killall -9 node
cd http-server
node bin/http-server&
