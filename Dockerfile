# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable for Django
ENV DJANGO_SETTINGS_MODULE=tienda.settings

ENV FRONTEND_HOSTS_LOCAL=*
ENV FRONTEND_CORS_LOCAL=django-vue-backend.onrender.com

ENV FRONTEND_HOSTS=*
ENV FRONTEND_CORS=http://localhost:8081

# COPY .env .

# RUN python -c "from decouple import config; print(config('FRONTEND_HOSTS_LOCAL'))"

# Collect static files
# RUN python manage.py collectstatic --noinput

# Run gunicorn when the container launches
CMD ["gunicorn", "tienda.wsgi:application", "--bind", "0.0.0.0:8000"]
