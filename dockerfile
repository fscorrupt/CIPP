# Simple docker file to clone a git repo and host its contents via nginx
# assumes a static site with an index.html that lives in the root of the repo
FROM nginx:alpine



RUN apk add --no-cache git
RUN git clone https://github.com/fscorrupt/cipp.git temp
RUN mv temp/* /usr/share/nginx/html/

# run nginx in foreground so container doesn't immediately exit.
CMD ["nginx", "-g", "daemon off;"]
