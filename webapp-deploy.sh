#!/bin/bash

APP_NAME="gb-web-app"
APP_DIR="/home/gdziebusik/$APP_NAME"

cd $APP_DIR

echo "Pulling latest code..."
git pull origin production

echo "📦 Installing dependencies..."
npm install

echo "⚙️ Building app..."
npm run build

echo "🚀 Restarting app with PM2..."
pm2 restart $APP_NAME || pm2 start .output/server/index.mjs --name $APP_NAME
