# Caddy + n8n セットアップ

このリポジトリは、Caddyを使ったn8nのリバースプロキシ設定を簡単に導入するためのガイドです。

## 概要
Caddyは、シンプルで設定が容易なリバースプロキシサーバーです。本構成では、n8nをCaddyのリバースプロキシを通じて公開し、環境変数を使用して柔軟にホスト名を設定できるようにしています。

## 使用方法
### 1. リポジトリをクローン
以下のコマンドでリポジトリをローカルに取得します。
```bash
git clone <repository-url>
cd <repository-folder>
```

### 2. サービスをビルドおよび起動
Docker Composeを使用してサービスをビルドし、起動します。
```bash
docker-compose up --build
```

### 3. 環境変数の設定
以下の環境変数を適宜設定してください:
- **`TZ`**: タイムゾーン (例: `Asia/Tokyo`)
- **`SSL_EMAIL`**: Let's Encryptの通知用メールアドレス
- **`DOMAIN_NAME`**: 使用するドメイン名 (例: `example.com`)

## 注意事項
- 初回起動時にCaddyがLet's EncryptでSSL証明書を取得します。インターネット接続が必要です。
- `DOMAIN_NAME`には有効なFQDNを設定してください。ローカル開発では`localhost`を使用できます。

## ライセンス
このプロジェクトは、MITライセンスの下で公開されています。

