# TGASC Bulletin Feed – The 8th Feed – An unofficial bulletin feed of the TGASC website

###### 正體中文版說明請往下滑。Scroll down for the Traditional Chinese version.

**The 8th Feed** is a collection of shell scripts designed to fetch and manage bulletin announcements from the official website of The General Association of the Scouts of China (Taiwan) (TGASC-Taiwan). It was initiated by James Kuo-Ping Lo, a member of the Rover Crew of St. Viator Catholic High School, Troop 8, Taichung City Council. It is helpful for automatically retrieving and broadcasting updates, for example, through a LINE Official Account.

## 📁 Project Structure

- `updateLatest.sh` – Checks for new bulletins and updates the cache with the latest issue ID.
- `fetch.sh` – Fetches the latest bulletin issue from the TGASC website.
- `broadcast.sh` –  Sends the latest bulletin issue to external platforms (e.g., LINE).
- `latest` – Cache for the most recent bulletin ID.
- `.github/workflows/` – GitHub Actions configurations for scheduled automation.

## 📚 Dependencies

### 🐚 Shell Scripts

- [`awk`](https://www.gnu.org/software/gawk/)
- [`Bash`](https://www.gnu.org/software/bash/)
- [`cURL`](https://github.com/curl/curl)
- [`htmlq`](https://github.com/mgdm/htmlq)
- [`jq`](https://github.com/jqlang/jq)
- [`sed`](https://www.gnu.org/software/sed/)

### 🌊 Workflow

- [`actions/checkout@v4`](https://github.com/actions/checkout)
- [`EndBug/add-and-commit@v9.1.4`](https://github.com/EndBug/add-and-commit)
- [`remarkablemark/setup-htmlq@v2.1.4`](https://github.com/remarkablemark/setup-htmlq)

## ⚙️ Usage

1. Ensure your environment supports basic Bash shell scripting and the required shell script dependencies mentioned above are installed.
2. Run `updateLatest.sh` to check for the latest bulletin issue.
3. Run `fetch.sh` to retrieve the latest bulletin issue.
4. Run `broadcast.sh` to send broadcast messages to chatbot services.

## 🔄 Automation

This project uses **GitHub Actions** to schedule and automate tasks. Scripts will be executed every 10 minutes to ensure the bulletin feed stays updated without manual effort.

## 👥 Contributors

- [Misawai](https://github.com/Misawai) (James Kuo-Ping Lo)

----
# 8 乎你知——童軍總會官網公告非官方推播（The 8th Feed）

**8 乎你知——童軍總會官網公告非官方推播（The 8th Feed）** 由臺中市第 8 團私立衛道中學東君羅浮群 James Kuo-Ping Lo 伙伴開發，是一套用於自動擷取中華民國童軍總會官網公告資訊的 Bash Shell 腳本工具。本工具可以定期抓取公告，並配合 LINE 官方帳號等平臺推播使用。

## 📁 專案結構

- `updateLatest.sh` – 檢查有無新公告，並更新最新公告序號的快取檔。
- `fetch.sh` – 從中華民國童軍總會官網擷取最新公告內容。
- `broadcast.sh` – 將公告內容推播至具備聊天機器人功能的平臺（如 LINE）。
- `latest` – 儲存最新公告序號的快取檔案。
- `.github/workflows/` – GitHub Actions 自動化流程設定。

## 📚 環境需求

### 🐚 Shell Scripts

- [`awk`](https://www.gnu.org/software/gawk/)
- [`Bash`](https://www.gnu.org/software/bash/)
- [`cURL`](https://github.com/curl/curl)
- [`htmlq`](https://github.com/mgdm/htmlq)
- [`jq`](https://github.com/jqlang/jq)
- [`sed`](https://www.gnu.org/software/sed/)

### 🌊 自動化 Workflow

- [`actions/checkout@v4`](https://github.com/actions/checkout)
- [`EndBug/add-and-commit@v9.1.4`](https://github.com/EndBug/add-and-commit)
- [`remarkablemark/setup-htmlq@v2.1.4`](https://github.com/remarkablemark/setup-htmlq)

## ⚙️ 使用方式

1. 確保使用的環境支援 Bash Shell 腳本，並已裝妥上述「環境需求 § Shell Script」一節中列出的套件。
2. 執行 `updateLatest.sh` 檢查有無新公告。
3. 執行 `fetch.sh` 擷取最新公告。
4. 執行 `broadcast.sh` 將公告推播至其他平臺。

## 🔄 自動化作業

本專案透過 **GitHub Actions** 排程自動化執行腳本，每隔 10 分鐘抓取官網公告一次並更新快取，讓使用者無須手動操作即可取得最新資訊。

## 👥 貢獻者

- [Misawai](https://github.com/Misawai)（James Kuo-Ping Lo）
