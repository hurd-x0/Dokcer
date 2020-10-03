version: '3'
services:

  #PHP Service
  app:
    build:
      context: .
      dockerfile: Dockerfile
    image: sepisoltani/php:newVersionWithStartShFile
    container_name: app
    restart: unless-stopped
    tty: true
    environment:
      SERVICE_NAME: app
      SERVICE_TAGS: dev
      CONTAINER_ROLE: app
    working_dir: /var/www
    volumes:
      - ./:/var/www
      - ./php/local.ini:/usr/local/etc/php/conf.d/local.ini
    networks:
      - app-network


    #mariadb Service
  db:
    image: mariadb
    container_name: db
    restart: unless-stopped
    tty: true
    ports:
      - "3306:3306"
    environment:
      MYSQL_DATABASE: laravel_db
      MYSQL_ROOT_PASSWORD: ِYOUR_MYSQL_ROOT_PASSWORD
      SERVICE_TAGS: dev
      SERVICE_NAME: mariadb
    volumes:
      - /dbdata:/var/lib/mysql/
      - ./mysql/my.cnf:/etc/mysql/my.cnf
    networks:
      - app-network

    # Phpmyadmin Service
  phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin/phpmyadmin
    container_name: phpmyadmin
    restart: always
    ports:
      - '8082:80'
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: YOUR_MYSQL_ROOT_PASSWORD
    networks:
      - app-network

    # Redis Service
  redis:
    image: redis:latest
    container_name: redis
    environment:
      - REDIS_PASSWORD=YOUR_REDIS_PASSWORD
    ports:
      - "6379:6379"
    restart: unless-stopped
    command: ["redis-server", "--requirepass", "YOUR_REDIS_PASSWORD"]
    networks:
      - app-network
      
#Docker Networks
networks:
  app-network:

#Volumes
volumes:
  dbdata:
    driver: local
