# ベースイメージを指定
FROM node:14

# 作業ディレクトリを作成
WORKDIR /usr/src/app

# パッケージファイルをコピー
COPY package*.json ./

# 依存関係をインストール
RUN npm install

# アプリケーションのソースコードをコピー
COPY . .

# アプリケーションをビルド（必要に応じて）
# RUN npm run build

# アプリケーションを起動
CMD ["npm", "start"]

# Cloud Runのポートを指定
EXPOSE 8080
