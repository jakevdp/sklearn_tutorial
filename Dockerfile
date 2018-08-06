FROM dbaibak/jupyter-lab:latest

USER dev

# install python modules
ADD requirements.txt /home/dev/app/
RUN pip install --user --no-cache-dir -r requirements.txt
