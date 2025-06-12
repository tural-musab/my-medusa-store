FROM node:18-alpine

WORKDIR /app

# Dependencies
COPY package*.json ./
RUN npm install

# Copy all files
COPY . .

# Build ve sonuçları koru
RUN npm run build && \
    echo "=== Build tamamlandı ===" && \
    ls -la .medusa/server/public/admin/

# MEDUSA_ADMIN_PATH environment variable
ENV MEDUSA_ADMIN_PATH=/app/.medusa/server/public/admin

# Port
EXPOSE 9000

# Start with debug
CMD ["sh", "-c", "echo 'Checking admin files before start:' && ls -la .medusa/server/public/admin/ && npm start"]
