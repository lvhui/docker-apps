FROM lvhui/ubuntu-cpp-env AS aibase
  
# 下载miniconda py37_4.9.2 并安装
WORKDIR /downloads
ENV HOME=/root
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.9.2-Linux-x86_64.sh && \
        chmod +x Miniconda3-py37_4.9.2-Linux-x86_64.sh && \
        ./Miniconda3-py37_4.9.2-Linux-x86_64.sh -b -p $HOME/miniconda
ENV PATH=$HOME/miniconda/bin:$PATH

# 更换conda清华源
ADD .condarc /root/.condarc
# 安装conda软件包
RUN conda update -y --all  && \
    conda upgrade -y --all
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
	nodejs \
	jedi=0.17

# 配置jupyter notebook配置文件
RUN jupyter notebook --generate-config
# 修改了notebook的ip 使非localhost可以访问, 设置jupyter默认密码123456
ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
# 安装jupyterlab插件
RUN jupyter labextension install @lckr/jupyterlab_variableinspector && \
	jupyter labextension install @aquirdturtle/collapsible_headings && \
	jupyter labextension install jupyterlab-execute-time && \
	jupyter labextension install @jupyterlab/toc && \
	jupyter nbextension enable --py widgetsnbextension && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager

# 更换pip清华源
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install tensorflow -i https://pypi.douban.com/simple
# 安装sklearn tensorflow 等
RUN pip install --upgrade pip && \
	pip install npm && \
	pip install -U scikit-learn 

# 安装PyTorch
RUN conda install pytorch torchvision torchaudio cpuonly -c pytorch
