FROM python:3.12-alpine

WORKDIR /app

# Copy static site files
COPY . .

# Railway injects $PORT; default to 8080 for local sanity
ENV PORT=8080
EXPOSE 8080

# Serve static files on $PORT, bind to 0.0.0.0 so Railway's edge proxy can reach it
CMD ["sh", "-c", "python3 -m http.server $PORT --bind 0.0.0.0"]
