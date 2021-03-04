FROM lvhui/ubuntu-cpp-env AS aibase
  
# 下载miniconda py37_4.9.2 并安装
WORKDIR /downloads
ENV HOME=/root
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.9.2-Linux-x86_64.sh && \
        chmod +x Miniconda3-py37_4.9.2-Linux-x86_64.sh && \
        ./Miniconda3-py37_4.9.2-Linux-x86_64.sh -b -p $HOME/miniconda
ENV PATH=$HOME/miniconda/bin:$PATH

# 更换conda清华源
# ADD .condarc /root/.condarc
# 安装conda软件包
RUN conda update -y --all  && \
    conda upgrade -y --all

# 更换pip清华源
# RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install --upgrade pip

# 安装科学计算套件 jedi最新版不兼容会导致jupyter代码补齐出错,所以指定0.17版
RUN conda install -y \
	numpy \
	scipy \
	pandas \
	matplotlib \
	jupyter \
	notebook \
	ipython \
	jupyterlab \
	jedi=0.17

# 安装jupyterlab插件
RUN pip install ipywidgets
RUN pip install lckr-jupyterlab-variableinspector
RUN pip install aquirdturtle_collapsible_headings
RUN pip install jupyterlab_execute_time
RUN pip install jupyterlab_widgets

# 安装sklearn tensorflow 等
RUN pip install tensorflow -i https://pypi.douban.com/simple
RUN pip install tensorflow 
RUN pip install -U scikit-learn 

# 安装PyTorch
RUN conda install pytorch torchvision torchaudio cpuonly -c pytorch

# 安装toc插件
# 安装nodejs jupyterlab 3.0以后内置集成了toc 所以不需要单独安装了
# RUN apt-get install -y npm && npm install -g n && n stable
# RUN jupyter labextension install @jupyterlab/toc

# 设置jupyter密码
RUN jupyter notebook --generate-config && yes 12345 | jupyter notebook password 
RUN jupyter lab --generate-config && yes 12345 | jupyter lab password
# 修改了监听全部端口,原来默认只监听localhost
ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

RUN yes 12345 | passwd

ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh
ENTRYPOINT ["/root/start.sh"]
