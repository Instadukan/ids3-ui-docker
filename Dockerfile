FROM node:12-alpine
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --update add --no-cache shadow \                                                                   
    gcc \                                                                                         
    musl-dev \                                                                                    
    autoconf \                                                                                    
    automake \                                                                                    
    make \                                                                                        
    libtool \                                                                                     
    nasm \                                                                                        
    tiff \                                                                                        
    jpeg \                                                                                        
    zlib \                                                                                        
    zlib-dev \                                                                                    
    file \                                                                                        
    pkgconf \
    libjpeg-turbo \
    libpng-dev \
    libwebp-tools
COPY ./package.json /app/nextjs/package.json
WORKDIR /app/nextjs
RUN npm install
# RUN npm run build
ENTRYPOINT npm run start
EXPOSE 3000