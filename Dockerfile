# Base image olarak Python 3.10'u kullanıyoruz
FROM python:3.10-slim

# Çalışma dizinini belirleyin
WORKDIR /app

# Gereken paketlerin kurulması için requirements.txt dosyasını kopyalayın
COPY requirements.txt .

# Paketleri yükleyin
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyalarını çalışma dizinine kopyalayın
COPY . .

# Streamlit'in dışarıya erişebilmesi için portu açıyoruz
EXPOSE 8501

# Streamlit uygulamasını başlatma komutu
CMD ["streamlit", "run", "Car_Price_Prediction_App.py", "--server.port=8501", "--server.address=0.0.0.0"]
