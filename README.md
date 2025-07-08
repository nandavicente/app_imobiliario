# 🏠 App Imobiliário IFNMG

Aplicativo mobile desenvolvido com **Flutter** e **Dart** para visualização e gerenciamento de imóveis para aluguel e venda. Este projeto é parte de uma iniciativa prática de aprendizado, com foco em responsividade, usabilidade e design limpo.

![Flutter](https://img.shields.io/badge/Flutter-3.8.1-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.2-blue?logo=dart)
![Status](https://img.shields.io/badge/status-em%20desenvolvimento-orange)

---

## ✨ Funcionalidades

- 🔍 Visualizar imóveis disponíveis (aluguel e novos)
- 📝 Anunciar novos imóveis
- 📆 Agendar visitas
- 📂 Gerenciar anúncios na área do anunciante
- 👤 Acessar perfil do usuário
- 💬 Formulário de contato
- 💡 Responsividade adaptativa (mobile e tablet)
- 📦 Armazenamento local com `SharedPreferences`

---

## 📲 Telas do Aplicativo

| Tela Inicial | Anunciar Imóvel | Meus Anúncios |
|--------------|------------------|----------------|
| ![home](assets/screenshots/home.png) | ![anunciar](assets/screenshots/anunciar.png) | ![meus-anuncios](assets/screenshots/meus_anuncios.png) |

> (📌 Adicione as imagens das telas reais no diretório `assets/screenshots/` e atualize os caminhos acima.)

---

## 🚀 Como Executar

1. **Clone o repositório:**

```bash
git clone https://github.com/seu-usuario/app_imobiliario.git
cd app_imobiliario

flutter pub get

flutter run

```bash 
lib/
├── main.dart
├── screens/             # Telas do app (Home, Alugar, Anuncie, Perfil, etc.)
├── widgets/             # Componentes reutilizáveis (ex: botões, cards)
├── models/              # Modelos de dados (visita, imóvel, etc)
├── services/            # Lógicas de serviço (ex: SharedPreferences)
└── helpers/             # Funções utilitárias (formatadores, validadores)
