## 1. Steps
sudo apt-get update
sudo apt-get install emacs
wget http://repo.continuum.io/archive/Anaconda3-2020.02-Linux-x86_64.sh
bash Anaconda3-2020.02-Linux-x86_64.sh

source .bashrc
which python3

jupyter notebook --generate-config
mkdir certs
cd certs/
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
ls -lrt


-->~/.jupyter/jupyter_notebook_config.py


c = get_config()

# Notebook config this is where you saved your pem cert
c.NotebookApp.certfile = u'/home/ubuntu/certs/mycert.pem'
# Run on all IP addresses of your instance
c.NotebookApp.ip = '*'
# Don't open browser by default
c.NotebookApp.open_browser = False
# Fix port to 8888
c.NotebookApp.port = 8888

(base) ubuntu@ip-172-31-29-13:~/certs$ jupyter notebook
[I 15:44:50.508 NotebookApp] Writing notebook server cookie secret to /home/ubuntu/.local/share/jupyter/runtime/notebook_cookie_secret
[I 15:44:50.880 NotebookApp] JupyterLab extension loaded from /home/ubuntu/anaconda3/lib/python3.7/site-packages/jupyterlab
[I 15:44:50.881 NotebookApp] JupyterLab application directory is /home/ubuntu/anaconda3/share/jupyter/lab
[I 15:44:50.884 NotebookApp] Serving notebooks from local directory: /home/ubuntu/certs
[I 15:44:50.884 NotebookApp] The Jupyter Notebook is running at:
[I 15:44:50.884 NotebookApp] https://ip-172-31-29-13:8888/?token=47afd4813df231f7088b699e9a7186f48dbcc07b67e5f958
[I 15:44:50.884 NotebookApp]  or https://127.0.0.1:8888/?token=47afd4813df231f7088b699e9a7186f48dbcc07b67e5f958
[I 15:44:50.884 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 15:44:50.888 NotebookApp] 
    
    To access the notebook, open this file in a browser:
        file:///home/ubuntu/.local/share/jupyter/runtime/nbserver-5909-open.html
    Or copy and paste one of these URLs:
        https://ip-172-31-29-13:8888/?token=47afd4813df231f7088b699e9a7186f48dbcc07b67e5f958
     or https://127.0.0.1:8888/?token=47afd4813df231f7088b699e9a7186f48dbcc07b67e5f958

sudo chown ubuntu mycert.pem

https://medium.com/@josemarcialportilla/getting-spark-python-and-jupyter-notebook-running-on-amazon-ec2-dec599e1c297


## 2. Useful links and info
   Markdown syntax guide (https://confluence.atlassian.com/display/STASH038/Markdown+syntax+guide)

## 3. Useful links ML (https://github.com/schneems/Octave)

## 4. Useful links ML (https://github.com/everpeace/ml-class-assignments)

## 5. Useful links qrupdate-1.1.2.tar.gz (https://sourceforge.net/projects/qrupdate/files/qrupdate/1.2/)

## 6. Support Vector Machine (SVM) LIB  (https://www.csie.ntu.edu.tw/~cjlin/libsvm/)

## 7. Support Vector Machine (SVM) LIB Data (https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/)

## 8. Support Vector Machine (SVM) LIB2 (http://svmlight.joachims.org/)

## 9. Machine Learning (http://machine-learning-course.joachims.org/)

    Amazon Web Services 
    Microsoft Azure 
    Google Cloud 

https://www.desmos.com/geometry/pwzyw6xy46

https://www.mturk.com/

https://aws.amazon.com/

xhttps://www.tutorialspoint.com/python3/python_pass_statement.htm

Complete SQL Bootcamp (udemiy)

http://seaborn.pydata.org/
https://github.com/mwaskom/seaborn
https://en.wikipedia.org/wiki/Kernel_density_estimation#Practical_estimation_of_the_bandwidth
http://seaborn.pydata.org/tutorial/aesthetics.html
https://matplotlib.org/3.1.1/gallery/color/colormap_reference.html
https://matplotlib.org/gallery.html#style_sheets
http://matplotlib.org/users/colormaps.html