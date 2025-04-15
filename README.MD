# TGASC Bulletin Feed

**TGASC Bulletin Feed** is a collection of shell scripts designed to fetch and manage bulletin announcements from the official website of The General Association of the Scouts of China (TGASC). This tool is useful for automatically retrieving and broadcasting updates, such as through a LINE Official Account.

## 📁 Project Structure

- `fetch.sh` – Fetches the latest bulletins from the TGASC website.
- `updateLatest.sh` – Updates the cached version of the latest bulletin.
- `broadcast.sh` –  Sends bulletins to external platforms (e.g., LINE).
- `latest/` – Directory for storing the most recent bulletin content.
- `.github/workflows/` – GitHub Actions configurations for scheduled automation.

## ⚙️ Usage

1. Make sure your environment supports basic shell scripting (e.g., Linux/macOS or WSL).
2. Run `fetch.sh` to retrieve the latest bulletin.
3. Run `updateLatest.sh` to update the `latest/` folder.
4. Run `broadcast.sh` to send announcements to a remote service.

## 🔄 Automation

This project uses **GitHub Actions** to schedule and automate tasks. Scripts will be executed every 10 minutes to ensure the bulletin feed stays up to date without manual effort.

## 👥 Contributors

- [Misawai](https://github.com/Misawai) (James Kuo-Ping Lo)

----
# 中華民國童軍總會官網公告通知小助手（TGASC Bulletin Feed）

**中華民國童軍總會官網公告通知小助手（TGASC Bulletin Feed）** 是一套用於自動擷取中華民國童軍總會官網公告資訊的 Shell 腳本工具。這個專案可以定期抓取公告，並可配合 LINE 官方帳號等平臺推播使用。

## 📁 專案結構

- `fetch.sh` – 從 TGASC 官網擷取最新公告內容。
- `updateLatest.sh` – 更新最新公告的快取資料。
- `broadcast.sh` – 將公告內容推播至其他平台（如 LINE）。
- `latest/` – 儲存最新公告內容的資料夾。
- `.github/workflows/` – GitHub Actions 自動化流程設定。

## ⚙️ 使用方式

1. 確保使用的環境支援 Shell 腳本（如 macOS、Linux 或 Windows 的 WSL）。
2. 執行 `fetch.sh` 擷取最新公告。
3. 執行 `updateLatest.sh` 更新快取內容。
4. 執行 `broadcast.sh` 將公告推播至其他平台。

## 🔄 自動化作業

本專案透過 **GitHub Actions** 排程自動化執行腳本，每隔 10 分鐘抓取官網公告一次並更新快取，讓使用者無須手動操作即可取得最新資訊。

## 👥 貢獻者

- [Misawai](https://github.com/Misawai)（James Kuo-Ping Lo）
