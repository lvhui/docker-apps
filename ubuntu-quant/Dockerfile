FROM lvhui/ubuntu-aibase 

# 配置同花顺数据接口API
WORKDIR /downloads
RUN wget http://resource.thsi.cn/download/iFinD/THSDataInterface_Linux_20210224.tar.gz && mkdir /ths && tar -zx -f THSDataInterface_Linux_20210224.tar.gz -C /ths
ENV PATH=/ths/bin64:$PATH LD_LIBRARY_PATH=/ths/bin64:$LD_LIBRARY_PATH
RUN cd /ths/bin64 && cp -r /ths/bin64/ /lib/bin64/ && apt-get install -y idn && python installiFinDPy.py /lib

# 安装通达信数据接口
RUN pip install pytdx

# 安装tushare
RUN pip install tushare

# 安装TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -zxvf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    pip install TA-Lib
