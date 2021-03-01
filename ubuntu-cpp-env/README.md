# ubuntu-cpp-env

* ubuntu:20.04环境下的cpp开发调试环境

* 默认用户是 user 密码是 password, 如果想修改用户和密码可以修改Dockerfile中的这一句

```bash
RUN useradd -m user \
  && yes password | passwd user
```
