# 🧪 Rick & Morty Flutter App

Simple Flutter application working with the Rick & Morty REST API.

---

## 📱 Screenshots

| Characters | Detail | Favorites |
| :---: | :---: | :---: |
| <img src="assets/screenshots/characters.png" width="250" /> | <img src="assets/screenshots/detail.png" width="250" /> | <img src="assets/screenshots/favorites.png" width="250" /> |
| <img src="assets/screenshots/characters_dark.png" width="250" /> | <img src="assets/screenshots/detail_dark.png" width="250" /> | <img src="assets/screenshots/favorites_dark.png" width="250" /> |
---

## ✨ Features

<table>
<tr>
<td>

- 📚 Characters list with pagination  
- 🔎 Search by name  
- 👤 Character detail  
- ❤️ Favorites  
- 💾 Hive persistence  
- 🌗 Dark / Light theme  
- ⚠️ Loading and error handling

</td>
<td>
<img src="assets/screenshots/failure.png" width="200"/>
</td>
</tr>
</table>

---
## 🏗 Architecture
<table>
<tr>
<td>
<img src="assets/screenshots/empty.png" width="200"/>
</td>
<td>

- **Feature-based structure** 
- **Layered separation (Presentation / Domain / Data)**  
- **BLoC state management** 
- **Repository pattern**  
- **RemoteDataSource / LocalDataSource**  
- **Dependency injection**  
</td>
</tr>
</table>

---

## 🛠 Technologies

- **State Management:** BLoC  
- **Networking:** Dio  
- **Local Storage:** Hive  
- **DI:** get_it  
- **Equality:** Equatable  

---

## 🎨 UI & UX


- **Custom light and dark themes** 
- **Hero animations between list and detail**  

---
## 🚀 Run

```bash
flutter pub get
flutter run