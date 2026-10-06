# FixItFlow – Mini Service Booking App

FixItFlow is a Flutter-based mini service booking application developed as part of the **Famto Mini Service Booking Flow assignment**.

The application allows users to browse home services, search for services, view service details, select a date and time slot, enter customer details, and complete a booking.

The project uses **local mock data** and does not require a backend or database.

---

## 📱 Features

- Clean and responsive Flutter UI
- Service category browsing
- Service listing by category
- Service search
- Service details
- Service image, price, rating and duration
- Date selection
- Time slot selection
- Customer information form
- Form validation
- Booking confirmation
- Booking history
- Profile page
- Loading states
- Empty states
- Error states
- Retry functionality
- Pull-to-refresh
- Reusable widgets
- Clean navigation using GoRouter
- Local/mock service data
- Provider state management
- MVVM architecture

---

## 🛠️ Service Categories

The application currently contains four main categories:

- ⚡ Electrician
- 🔧 Plumbing
- ❄️ AC Repair
- 🧹 Cleaning

Each category contains multiple services.

### Example Services

| Category | Service | Price |
|---|---|---:|
| Electrician | Home Electrical Repair | ₹499 |
| Electrician | Fan Installation | ₹349 |
| Plumbing | Bathroom Plumbing | ₹399 |
| Plumbing | Tap & Sink Repair | ₹299 |
| AC Repair | AC Service & Cleaning | ₹699 |
| AC Repair | AC Installation | ₹1499 |
| Cleaning | Full Home Cleaning | ₹999 |
| Cleaning | Kitchen Cleaning | ₹599 |

---

## 🔎 Search

The home screen includes a functional service search.

Users can search using:

- Service name
- Category
- Keywords from the service description

### Examples

```text
electrician
fan
plumbing
tap
AC
cleaning
kitchen
```

Search results are displayed immediately from the locally loaded mock service data.

---

## 🔄 Booking Flow

The main booking flow is:

```text
Home
  ↓
Service Category
  ↓
Service List
  ↓
Service Details
  ↓
Booking
  ↓
Confirmation
```

### Home

Users can:

- Browse service categories
- Search services
- Open their profile
- View popular service information

### Service Category

Selecting a category displays services belonging to that category.

### Service Details

The service details page displays:

- Service name
- Service image
- Price
- Rating
- Reviews
- Duration
- Description

### Booking

Users select:

- Date
- Time slot
- Customer name
- Phone number
- Address

The form validates the entered information before allowing the booking.

### Confirmation

After successful booking, the user is redirected to the confirmation screen where the booking information can be viewed.

---

## 🏗️ Architecture

The project follows the **MVVM architecture**.

```text
View
 │
 ▼
ViewModel
 │
 ▼
Repository
 │
 ▼
Mock Data
```

### View

The UI screens are responsible for displaying information and handling user interactions.

Examples:

```text
HomeScreen
ServiceListScreen
ServiceDetailsScreen
BookingScreen
ConfirmationScreen
ProfileScreen
```

### ViewModel

ViewModels manage application state and business logic.

```text
HomeViewModel
ServiceViewModel
BookingViewModel
```

### Repository

The repository provides mock service and category data.

```text
ServiceRepository
```

This keeps data access separate from the UI.

---

## 📂 Project Structure

```text
lib/
│
├── main.dart
│
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   │
│   ├── routes/
│   │   └── app_routes.dart
│   │
│   └── theme/
│       ├── app_colors.dart
│       └── app_theme.dart
│
├── data/
│   └── repositories/
│       └── service_repository.dart
│
├── models/
│   ├── booking_model.dart
│   ├── category_model.dart
│   └── service_model.dart
│
├── viewmodels/
│   ├── booking_view_model.dart
│   ├── home_view_model.dart
│   └── service_view_model.dart
│
├── views/
│   ├── booking/
│   │   └── booking_screen.dart
│   │
│   ├── confirmation/
│   │   └── confirmation_screen.dart
│   │
│   ├── home/
│   │   └── home_screen.dart
│   │
│   ├── profile/
│   │   └── profile_screen.dart
│   │
│   ├── service_details/
│   │   └── service_details_screen.dart
│   │
│   └── service_list/
│       └── service_list_screen.dart
│
└── widgets/
    ├── category_card.dart
    ├── custom_button.dart
    ├── custom_text_field.dart
    ├── date_selector.dart
    ├── service_card.dart
    ├── state_view.dart
    └── time_slot_chip.dart
```

---

## 📦 Dependencies

The project uses a minimal number of packages.

### Provider

Used for state management.

```yaml
provider: ^6.1.5+1
```

### GoRouter

Used for application navigation.

```yaml
go_router: ^16.2.4
```

### Cupertino Icons

Flutter's Cupertino icon package.

```yaml
cupertino_icons: ^1.0.8
```

---

## 🧠 State Management

The project uses **Provider** for state management.

### HomeViewModel

Responsible for:

- Loading categories
- Loading states
- Empty states
- Error handling
- Retry functionality

### ServiceViewModel

Responsible for:

- Loading services
- Category filtering
- Search
- Search result management
- Loading states
- Empty states
- Error handling

### BookingViewModel

Responsible for:

- Selected service
- Selected date
- Selected time slot
- Customer information
- Booking creation
- Booking history

---

## 🗃️ Data Source

The application currently uses **mock/local data**.

There is no:

- Firebase
- REST API
- SQL database
- Cloud database
- Authentication backend

The service data is provided through:

```text
ServiceRepository
```

This makes the application easy to run and test without any external configuration.

---

## 📝 Form Validation

The booking form validates the following fields.

### Customer Name

- Cannot be empty
- Minimum 2 characters

### Phone Number

The application accepts a valid 10-digit Indian mobile number beginning with 6–9.

Example:

```text
9876543210
```

### Address

- Cannot be empty
- Minimum 10 characters

### Booking Requirements

A booking can only be created when:

- Service is selected
- Date is selected
- Time slot is selected
- Customer name is entered
- Phone number is valid
- Address is entered

---

## ⏰ Available Time Slots

The application provides predefined booking slots:

```text
09:00 AM
10:30 AM
12:00 PM
02:00 PM
03:30 PM
05:00 PM
06:30 PM
```

---

## 🎨 UI & Design

The application follows a modern Material 3 design.

The UI includes:

- Rounded cards
- Consistent spacing
- Reusable components
- Responsive layouts
- Custom color theme
- Service images
- Icons
- Loading indicators
- Empty state messages
- Error state messages

Primary color:

```text
#5B4BDB
```

Background:

```text
#F8F9FC
```

---

## 🧩 Reusable Widgets

Reusable UI components are placed inside the `widgets` folder.

Examples:

```text
CategoryCard
ServiceCard
CustomButton
CustomTextField
DateSelector
TimeSlotChip
StateView
```

This helps avoid repeating UI code across different screens.

---

## 🚦 Application States

The application handles different UI states.

### Loading

Displayed while mock data is being loaded.

### Loaded

Displays available categories or services.

### Empty

Displayed when no data or search results are available.

### Error

Displayed when data loading fails, with a retry option.

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <your-github-repository-url>
```

### 2. Open the Project

Open the project using:

- Android Studio
- VS Code

### 3. Install Dependencies

Run:

```bash
flutter pub get
```

### 4. Check Flutter Setup

```bash
flutter doctor
```

### 5. Run the Application

```bash
flutter run
```

---

## 💻 Requirements

Recommended development environment:

```text
Flutter 3.x
Dart 3.x
Android Studio
Android SDK
```

The project does not require Firebase or any backend configuration.

---

## 📱 Supported Flow

```text
┌───────────────┐
│     Home      │
└───────┬───────┘
        │
        ├──────── Search
        │
        ▼
┌───────────────────┐
│ Service Category  │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│   Service List    │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│ Service Details   │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│     Booking       │
│                   │
│ Date              │
│ Time              │
│ Name              │
│ Phone             │
│ Address           │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│    Confirmation   │
└───────────────────┘
```

---

## 🔮 Possible Future Improvements

The current implementation intentionally uses local mock data. It can later be extended with:

- Firebase Authentication
- Firebase Firestore
- REST API integration
- Real service providers
- Online payments
- Push notifications
- Booking cancellation
- Booking rescheduling
- Provider/service-provider accounts
- Real-time booking availability
- User authentication
- Persistent booking history

---

## 👨‍💻 Development Approach

The project was developed with focus on:

- Clean architecture
- Separation of concerns
- Reusable widgets
- Maintainable code
- Simple state management
- Responsive UI
- User-friendly navigation
- Proper form validation
- Handling loading, empty and error states

---

## 📄 Assignment

This project was developed for the:

**Famto Mini Service Booking Flow Assignment**

### Objective

Build a simple service booking experience where a user can:

1. Browse service categories
2. Select a service
3. View service details
4. Select date and time
5. Enter customer information
6. Confirm a booking

---

## 👤 Developer

**Abhishek P**

BCA Graduate | Flutter Developer

Built using:

```text
Flutter
Dart
Provider
MVVM
GoRouter
```