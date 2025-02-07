# Caddy + n8n セットアップ

Caddyを使ったn8nのリバースプロキシ設定をしたものです

## 概要

* Caddyは、シンプルで設定が容易なリバースプロキシサーバーです
* 本構成では、n8nをCaddyのリバースプロキシを通じて公開し、環境変数を使用して柔軟にホスト名を設定できるようにしています

## 使用方法

### 1. リポジトリをクローン
以下のコマンドでリポジトリをローカルに取得します。
```bash
git clone https://github.com/dross-ai/n8n-caddy.git
cd n8n-caddy
```

### 2. サービスをビルドおよび起動
Docker Composeを使用してサービスをビルドし、起動します。
```bash
docker compose up --build
```

### 3. 環境変数の設定

以下の環境変数を適宜設定してください:

- **`TZ`**: タイムゾーン (例: `Asia/Tokyo`)
- **`SSL_EMAIL`**: TLS証明書の取得・管理に使用されるメールアドレス
- **`DOMAIN_NAME`**: 使用するドメイン名 (例: `example.com`)

## 注意事項

- 初回起動時にCaddyがLet's EncryptでSSL証明書を取得します。インターネット接続が必要です。
- `DOMAIN_NAME`には有効なFQDNを設定してください。ローカル開発では`localhost`を使用できます。

## ライセンス

このプロジェクトは、MITライセンスの下で公開されています。

