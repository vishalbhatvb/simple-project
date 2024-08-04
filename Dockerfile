FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
EXPOSE 8001  
CMD ["nginx", "-g", "daemon off;"]
