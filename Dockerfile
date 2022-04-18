FROM composer

# copying the source directory and install the dependencies with composer
COPY . /app

WORKDIR /app

# run composer install to install the dependencies
RUN composer install \
  --ignore-platform-reqs \
  --optimize-autoloader \
  --no-interaction \
  --no-progress
