FROM python:3.7.3-stretch

## Step 1:
WORKDIR /opt

## Step 2:
COPY model_data ./model_data
COPY requirements.txt ./

## Step 3:
RUN pip install -r requirements.txt
# hadolint ignore=DL3013

# Moved this after pip install to make rebuilds faster
COPY app.py ./

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
ENTRYPOINT ["python3", "/opt/app.py"]

