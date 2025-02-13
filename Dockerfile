# Use an official Python runtime as a parent image
FROM python:3.7
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY Pipfile Pipfile.lock ./
RUN pip install pipenv
RUN pipenv install --deploy --ignore-pipfile
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 5000

# Run app.py when the container launches
CMD ["pipenv", "run", "python", "app.py"]