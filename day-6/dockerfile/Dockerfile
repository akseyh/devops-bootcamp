# docker run -it ubuntu
FROM ubuntu

RUN apt update 

# RUN apt install figlet -y
RUN ["apt", "install", "figlet", "-y"]

ENTRYPOINT ["figlet"]

# Build edildiğinde CMD çalışmaz not olarak eklenir.
# Container run edildiğinde ilk çalışacak olan komuttur.
# Dockerfile içerisinde iki CMD olursa sonuncusu geçerli olur.
# CMD figlet merhaba // bu şekilde de kullanılır fakat sonuç figlet /bin/bash merhaba olacaktır. !!
CMD ["merhaba"]