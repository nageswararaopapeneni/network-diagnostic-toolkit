# 🌐 Network Diagnostic Toolkit

<p align="center">

![Bash](https://img.shields.io/badge/Bash-5.x-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?style=for-the-badge&logo=linux)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.0.0-success?style=for-the-badge)

</p>

<p align="center">
A modular Bash-based Network Diagnostic Toolkit for Linux that provides DNS, HTTP, SSL, Routing, Firewall, Port Scanning, Connection Analysis, and Reporting utilities through a single command-line interface.
</p>

---

# 📖 Overview

Network Diagnostic Toolkit is an open-source command-line application built with Bash to simplify Linux network troubleshooting and diagnostics.

Instead of remembering numerous Linux networking commands, the toolkit provides a consistent interface that groups related diagnostics into modular commands.

The project follows a modular architecture, making it easy to extend, maintain, and integrate into automation workflows.

---

# ✨ Features

- 🌐 Network Interface Diagnostics
- 🔍 DNS Lookup & Reverse Lookup
- 📡 Ping Diagnostics
- 🔌 Port Inspection & Port Scanning
- 🛣️ Routing Diagnostics
- 🌍 HTTP Health Checks
- 🔒 SSL Certificate Inspection
- 🛡️ Firewall Inspection
- 🔗 Active Connection Analysis
- 📄 Network Report Generation
- 🧩 Modular Architecture
- ⚡ Lightweight Bash Implementation
- 🐧 Linux Native
- 🔍 ShellCheck Validated
- 🚀 GitHub Actions Ready

---

# 🏗️ Project Structure

```text
network-diagnostic-toolkit
│
├── bin/
├── config/
├── docs/
├── lib/
├── modules/
│   ├── interfaces/
│   ├── dns/
│   ├── ping/
│   ├── ports/
│   ├── routing/
│   ├── http/
│   ├── ssl/
│   ├── firewall/
│   ├── connections/
│   └── reports/
├── tests/
├── VERSION
└── README.md
```# 🌐 Network Diagnostic Toolkit

<p align="center">

![Bash](https://img.shields.io/badge/Bash-5.x-green?style=for-the-badge&logo=gnu-bash)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?style=for-the-badge&logo=linux)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.0.0-success?style=for-the-badge)

</p>

<p align="center">
A modular Bash-based Network Diagnostic Toolkit for Linux that provides DNS, HTTP, SSL, Routing, Firewall, Port Scanning, Connection Analysis, and Reporting utilities through a single command-line interface.
</p>

---

# 📖 Overview

Network Diagnostic Toolkit is an open-source command-line application built with Bash to simplify Linux network troubleshooting and diagnostics.

Instead of remembering numerous Linux networking commands, the toolkit provides a consistent interface that groups related diagnostics into modular commands.

The project follows a modular architecture, making it easy to extend, maintain, and integrate into automation workflows.

---

# ✨ Features

- 🌐 Network Interface Diagnostics
- 🔍 DNS Lookup & Reverse Lookup
- 📡 Ping Diagnostics
- 🔌 Port Inspection & Port Scanning
- 🛣️ Routing Diagnostics
- 🌍 HTTP Health Checks
- 🔒 SSL Certificate Inspection
- 🛡️ Firewall Inspection
- 🔗 Active Connection Analysis
- 📄 Network Report Generation
- 🧩 Modular Architecture
- ⚡ Lightweight Bash Implementation
- 🐧 Linux Native
- 🔍 ShellCheck Validated
- 🚀 GitHub Actions Ready

---

# 🏗️ Project Structure

```text
network-diagnostic-toolkit
│
├── bin/
├── config/
├── docs/
├── lib/
├── modules/
│   ├── interfaces/
│   ├── dns/
│   ├── ping/
│   ├── ports/
│   ├── routing/
│   ├── http/
│   ├── ssl/
│   ├── firewall/
│   ├── connections/
│   └── reports/
├── tests/
├── VERSION
└── README.md
```
---

# 📋 Requirements

Before using the toolkit, ensure the following software is installed:

| Tool | Purpose |
|------|---------|
| Bash | Shell Runtime |
| curl | HTTP Diagnostics |
| openssl | SSL Inspection |
| iproute2 | Network Interfaces & Routing |
| iputils-ping | Ping Diagnostics |
| ss | Connection Analysis |
| ufw *(optional)* | Firewall Inspection |

---

# ⚙️ Installation

Clone the repository:

```bash
git clone https://github.com/<YOUR_GITHUB_USERNAME>/network-diagnostic-toolkit.git
```

Navigate into the project:

```bash
cd network-diagnostic-toolkit
```

Make the CLI executable:

```bash
chmod +x bin/network-tool
```

Verify the installation:

```bash
./bin/network-tool --version
```

Expected output:

```text
Network Diagnostic Toolkit v1.0.0
```

---

# 🚀 Quick Start

Display help:

```bash
./bin/network-tool --help
```

List interfaces:

```bash
./bin/network-tool interfaces list
```

Perform a DNS lookup:

```bash
./bin/network-tool dns lookup google.com
```

Run a ping test:

```bash
./bin/network-tool ping run google.com
```

Check HTTP health:

```bash
./bin/network-tool http health https://google.com
```

Inspect an SSL certificate:

```bash
./bin/network-tool ssl info google.com
```

Generate a report:

```bash
./bin/network-tool reports summary
```
---

# 📚 Command Reference

## Interfaces

```bash
network-tool interfaces list
network-tool interfaces info <interface>
network-tool interfaces stats <interface>
network-tool interfaces mtu <interface>
```

---

## DNS

```bash
network-tool dns lookup <domain>
network-tool dns reverse <ip-address>
network-tool dns servers
```

---

## Ping

```bash
network-tool ping run <host>
network-tool ping latency <host>
network-tool ping loss <host>
```

---

## Ports

```bash
network-tool ports listening
network-tool ports check <host> <port>
network-tool ports scan <host>
```

---

## Routing

```bash
network-tool routing table
network-tool routing gateway
network-tool routing interface
```

---

## HTTP

```bash
network-tool http status <url>
network-tool http headers <url>
network-tool http timing <url>
network-tool http health <url>
```

---

## SSL

```bash
network-tool ssl info <host>
network-tool ssl expiry <host>
network-tool ssl issuer <host>
network-tool ssl protocols <host>
```

---

## Firewall

```bash
network-tool firewall status
network-tool firewall rules
network-tool firewall ufw
```

---

## Connections

```bash
network-tool connections active
network-tool connections tcp
network-tool connections udp
network-tool connections established
```

---

## Reports

```bash
network-tool reports summary
network-tool reports network
network-tool reports security
network-tool reports full
```
---

# 🏛️ Architecture

```
                           network-tool
                                 │
                    ┌────────────┴────────────┐
                    │                         │
              Command Parser          Common Libraries
                    │
    ┌───────────────┼──────────────────────────────────────┐
    │               │               │                      │
 Interfaces        DNS            HTTP                  SSL
 Ports           Routing       Firewall           Connections
                            Reports
```

The toolkit follows a modular architecture where each module is responsible for a specific networking domain. The CLI dispatcher routes commands to the appropriate module, promoting maintainability and extensibility.

---

# 🎬 Demo

A terminal demonstration of the toolkit is available in:

```
docs/demo/demo.cast
```

The demo showcases:

- Version information
- Help menu
- Interface inspection
- DNS lookup
- Ping diagnostics
- Port scanning
- Routing inspection
- HTTP health checks
- SSL certificate inspection
- Firewall status
- Active network connections
- Report generation

---

# 📷 Screenshots

Place screenshots in:

```
docs/screenshots/
```

Recommended screenshots:

| Screenshot | Status |
|------------|--------|
| Help Menu | ⬜ |
| Version | ⬜ |
| Interfaces | ⬜ |
| DNS Lookup | ⬜ |
| Ping | ⬜ |
| Ports | ⬜ |
| Routing | ⬜ |
| HTTP | ⬜ |
| SSL | ⬜ |
| Firewall | ⬜ |
| Connections | ⬜ |
| Reports | ⬜ |
| GitHub Actions | ⬜ |
---

# ✅ Continuous Integration

This project is designed to integrate with GitHub Actions for automated quality checks.

Current validation includes:

- Bash syntax validation
- ShellCheck static analysis
- Project structure verification

Future improvements:

- Automated integration tests
- Multi-distribution testing
- Release automation

---

# 🛣️ Roadmap

## Version 1.0.0

- ✅ Modular CLI Architecture
- ✅ Network Interfaces
- ✅ DNS Diagnostics
- ✅ Ping Diagnostics
- ✅ Port Utilities
- ✅ Routing Inspection
- ✅ HTTP Diagnostics
- ✅ SSL Inspection
- ✅ Firewall Inspection
- ✅ Connection Analysis
- ✅ Report Generation

---

## Planned for v1.1.0

- Automated Test Suite
- Configuration Profiles
- Better Logging
- Colored Output
- JSON Report Export

---

## Planned for v2.0.0

- Interactive Terminal UI
- Plugin Support
- Docker Diagnostics
- Kubernetes Integration
- Cloud Connectivity Checks

---

# 🤝 Contributing

Contributions are welcome.

If you'd like to improve this project:

1. Fork the repository.
2. Create a feature branch.
3. Commit your changes.
4. Open a Pull Request.

For larger changes, please open an issue first to discuss the proposed improvement.

---

# 📄 License

This project is licensed under the **MIT License**.

See the `LICENSE` file for details.

---

# 👨‍💻 Author

**Nageswara Rao Papeneni**

- GitHub: https://github.com/nageswararaopapeneni
- LinkedIn: https://www.linkedin.com/in/nageswara-rao-papeneni-53798524b/
---

# ⭐ Support

If you found this project useful:

- ⭐ Star the repository
- 🍴 Fork the project
- 🐛 Report issues
- 💡 Suggest improvements

Your feedback helps make the project better.

---

<p align="center">
Built with ❤️ using Bash and Linux.
</p>