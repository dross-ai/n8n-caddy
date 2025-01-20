# Dockerfile の説明

このリポジトリには、n8n と Traefik を Fly.io 上で動作させるための Dockerfile が含まれています。Procfile を利用して複数プロセスを簡潔に管理します。

## 主な特徴
- **n8n**: ローコードでワークフローの自動化が可能なツール。
- **Traefik**: リバースプロキシとロードバランサ。
- **Procfile**: 複数プロセスを管理。
- **Overmind**: Procfile マネージャ。
- 最新バージョンの Traefik (v3.3.2) と Overmind (v2.5.1) を利用。
- Node.js v22.13.0 に対応。

## 使用方法

1. **リポジトリのクローン**
   ```bash
   git clone <リポジトリURL>
   cd <リポジトリ名>
   ```

2. **Docker イメージのビルド**
   ```bash
   docker build -t n8n-traefik .
   ```

3. **Fly.io でのデプロイ**
   事前に Fly.io CLI を設定してください。
   ```bash
   fly launch
   fly deploy
   ```

## 環境変数

以下の環境変数を使用します:
- `OVERMIND_VERSION` (デフォルト: `2.5.1`): Overmind のバージョン指定。
- `TRAEFIK_VERSION` (デフォルト: `3.3.2`): Traefik のバージョン指定。
- `NODE_VERSION` (デフォルト: `22.13.0`): Node.js のバージョン指定。

## ファイル構成
- `Dockerfile`: イメージのビルド設定。
- `traefik.yml`: Traefik の設定ファイル。
- `Procfile`: プロセス管理設定。

## 注意事項
- Traefik の証明書ストレージや n8n データは Fly.io のボリュームを利用して永続化してください。
- Fly.io アカウントと CLI の設定が必要です。

## ライセンス
このプロジェクトは MIT ライセンスのもと提供されています。

