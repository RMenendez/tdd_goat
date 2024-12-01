FROM python:3.13-slim

RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

COPY requirements.txt requirements.txt
#RUN pip install "django<6" gunicorn whitenoise
RUN pip install -r requirements.txt

COPY src /src

WORKDIR /src

RUN python manage.py collectstatic

# Comento porque me da error
#RUN addgroup --system nonroot && adduser --system --no-create-home --disabled-password --group nonroot
#USER nonroot

ENV DJANGO_DEBUG_FALSE=1
CMD ["gunicorn", "--bind", "0.0.0.0:8888", "superlists.wsgi:application"] 
