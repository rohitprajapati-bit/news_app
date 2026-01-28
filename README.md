# 📰 News App

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20Web-blue)](https://flutter.dev)

A professional news application built with Flutter, implementing Clean Architecture, BLoC state management, and offline-first capabilities. Features real-time news updates, intelligent caching, and a seamless user experience across all platforms.

## ✨ Features

- **📰 Real-time News**: Fetches latest news from multiple sources
- **🔍 Smart Search**: Advanced search with filters and suggestions
- **💾 Offline Support**: Read cached articles without internet
- **🔄 Pull to Refresh**: Seamless content updates
- **📱 Cross-platform**: Optimized for Android, iOS, Web, and Desktop
- **⚡ Performance**: Fast loading with efficient caching
- **🎨 Beautiful UI**: Material Design 3 components
- **♿ Accessibility**: Screen reader and TalkBack support

## 🏗️ Architecture

This project follows **Clean Architecture** principles for maintainability and scalability:

```
lib/
├── core/
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── network/
│   │   ├── network_info.dart
│   │   └── api_client.dart
│   └── utils/
│       ├── constants.dart
│       └── helpers.dart
│
├── data/
│   ├── models/
│   │   └── news_article_model.dart
│   ├── datasources/
│   │   ├── news_remote_datasource.dart
│   │   └── news_local_datasource.dart
│   └── repositories/
│       └── news_repository_impl.dart
│
├── domain/
│   ├── entities/
│   │   └── news_article.dart
│   ├── repositories/
│   │   └── news_repository.dart
│   └── usecases/
│       ├── get_news.dart
│       └── search_news.dart
│
├── presentation/
│   ├── bloc/
│   │   ├── news_bloc.dart
│   │   ├── news_event.dart
│   │   └── news_state.dart
│   ├── pages/
│   │   ├── home_page.dart
│   │   ├── search_page.dart
│   │   └── detail_page.dart
│   └── widgets/
│       ├── news_card.dart
│       └── loading_indicator.dart
│
└── main.dart
```

### Architecture Layers

- **Presentation Layer**: UI components, BLoC/Cubit, Widgets
- **Domain Layer**: Business logic, Entities, Use Cases
- **Data Layer**: API integration, Local storage, Repository implementation
- **Core Layer**: Utilities, Constants, Error handling

## 🛠️ Tech Stack

| Category | Technology |
|----------|-----------|
| **Framework** | Flutter 3.0+ |
| **Language** | Dart 3.0+ |
| **State Management** | BLoC / Cubit |
| **Networking** | Dio |
| **Local Database** | Hive |
| **Dependency Injection** | get_it |
| **API** | NewsAPI |
| **Architecture** | Clean Architecture |

### Key Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.0
  dio: ^5.0.0
  hive: ^2.2.0
  hive_flutter: ^1.1.0
  get_it: ^7.6.0
  equatable: ^2.0.5
  cached_network_image: ^3.2.0
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https:https://github.com/rohitprajapati-bit/news_app.git
   cd news_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup API Key**
   - Get your free API key from [NewsAPI.org](https://newsapi.org)
   - Create a `.env` file in the root directory:
     ```
     NEWS_API_KEY=d14e1d2592c645ad962ddf6f226b09bf
     ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Build Commands

### Android
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (for Play Store)
flutter build appbundle --release
```

### iOS
```bash
# Debug
flutter build ios --debug

# Release
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

### Desktop (Windows)
```bash
flutter build windows --release
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
```

## 📊 Project Structure Highlights

### State Management Flow
```
UI → Event → BLoC → UseCase → Repository → DataSource → API/Cache
```

### Error Handling
- Custom exceptions for different error types
- Failure classes for domain layer
- User-friendly error messages

### Caching Strategy
- **First load**: Fetch from API and cache
- **Subsequent loads**: Display cache first, then update
- **Offline**: Serve cached data with offline indicator

## 🎨 Design Patterns Used

- **Repository Pattern**: Abstracts data sources
- **Dependency Injection**: Decouples components
- **Observer Pattern**: BLoC state management
- **Factory Pattern**: Model creation
- **Singleton Pattern**: Service instances

## 🔄 State Management (BLoC)

```dart
// Example: News BLoC
sealed class NewsEvent {}
class FetchNewsEvent extends NewsEvent {}
class SearchNewsEvent extends NewsEvent {
  final String query;
}

sealed class NewsState {}
class NewsInitial extends NewsState {}
class NewsLoading extends NewsState {}
class NewsLoaded extends NewsState {
  final List<NewsArticle> articles;
}
class NewsError extends NewsState {
  final String message;
}
```

## 🌐 API Integration

**Base URL**: `https://newsapi.org/v2/`

**Endpoints Used**:
- `GET /top-headlines` - Latest news
- `GET /everything` - Search articles
- `GET /sources` - News sources

## 💾 Local Storage (Hive)

**Boxes**:
- `newsBox` - Cached articles
- `settingsBox` - User preferences
- `bookmarksBox` - Saved articles

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Rohit Prajapati**  
Flutter Developer

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/rohitprajapati-bit)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rohitprajapati77083b30a/)
[![Portfolio](https://img.shields.io/badge/Portfolio-FF5722?style=for-the-badge&logo=todoist&logoColor=white)](https://upgrade-portfolio.web.app/)

## 🙏 Acknowledgments

- [NewsAPI](https://newsapi.org) for the news data
- [Flutter](https://flutter.dev) team for the amazing framework
- Open source community for the packages used

---

<p align="center">Made with ❤️ by Rohit Prajapati</p>
<p align="center">⭐ Star this repo if you found it helpful!</p>
