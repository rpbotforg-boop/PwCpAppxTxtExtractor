FROM python:3.10-slim

# 🔹 System packages (ffmpeg + mediainfo)
RUN apt-get update && apt-get install -y ffmpeg mediainfo \
    && rm -rf /var/lib/apt/lists/*

# 🔹 Python
RUN pip install --upgrade pip

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "main.py"]
