# Back
FROM python:3.9

RUN apt-get update

RUN apt-get update && apt-get install -y --no-install-recommends \        
        curl \                
        vim \        
        && \
    apt-get clean 

RUN pip install --upgrade pip
RUN pip install fastapi uvicorn
RUN pip install numpy pandas    

RUN mkdir -p app
WORKDIR /app

# product
COPY . /app

CMD ["uvicorn", "src.run:app", "--reload", "--host", "0.0.0.0"]
