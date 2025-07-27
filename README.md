```markdown
# 🚀 Contact-APP – Flutter Contact Manager with Hive

**Contact-APP** is a modern, offline-first Flutter application for managing your contacts. It features smooth CRUD operations, Hive-based local storage, real-time search, and form validation, making it perfect for personal or demo use.

---

## ✨ Features

- 🧠 Fast, local NoSQL database using Hive
- 📇 Add, edit, delete contacts with ease
- 🔍 Real-time search functionality
- ✅ Form validation (non-empty name, valid number, etc.)
- 💡 Simple, scalable file structure

---

## 📁 Project Structure

```

lib/
├── models/
│   └── contact.dart        # Hive data model
├── screens/
│   ├── home\_screen.dart    # Lists & searches contacts
│   └── add\_edit\_screen.dart # Add/update contact
├── widgets/
│   └── contact\_tile.dart   # Reusable contact card
└── main.dart               # App entry point

````

---

## 🛠️ Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/contact-app.git
   cd contactx
````

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Generate Hive adapter:**

   ```bash
   flutter pub run build_runner build
   ```

4. **Run the app:**

   ```bash
   flutter run
   ```

---

## ⚠️ iOS Setup (CocoaPods)

If you're running on iOS and see `CocoaPods not installed`:

```bash
sudo gem install cocoapods
cd ios && pod install && cd ..
```

---

## 🧰 Tech Stack

* **Flutter**
* **Hive** – local storage
* **build\_runner** – for code generation
* **hive\_generator** – adapter generator

---

## 👨‍💻 Author

**Ayush Yadav**
📧 [ayushyadav.dev@gmail.com](mailto:ayushyadav.dev@gmail.com)
🔗 [LinkedIn]((https://www.linkedin.com/in/ayush-yadav-8baa5a261/)) 

---

## 📝 License

MIT License © 2025 Ayush Yadav

> “Manage your future connections, today.”

```

---

```
