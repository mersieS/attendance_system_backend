# Face Recognition Attendance System – Rails API

This is the backend API for a facial recognition-based student attendance system. It provides RESTful endpoints to manage students and attendance records. A Python-based facial recognition module interacts with this API to mark attendance automatically.

## 🚀 Tech Stack

- Ruby on Rails 7
- PostgreSQL
- Active Storage (Disk service)
- RSpec (for testing)
- JWT Authentication (optional)
- Rswag (for API documentation)

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/attendance-api.git
cd attendance-api
```

### 2. Install Dependencies

```bash
bundle install
yarn install
```

### 3. Database Setup

```bash
rails db:setup
```

### 4. Set Active Storage URL Options

In `config/environments/development.rb`, add:

```ruby
Rails.application.routes.default_url_options[:host] = 'localhost:3000'
ActiveStorage::Current.url_options = Rails.application.routes.default_url_options
```

### 5. Run the Server

```bash
rails s
```

## 📡 API Endpoints

### Students

| Method | Endpoint              | Description              |
|--------|------------------------|--------------------------|
| GET    | `/api/students`        | List all students        |
| POST   | `/api/students`        | Create a new student     |
| GET    | `/api/students/:id`    | Show a specific student  |
| PUT    | `/api/students/:id`    | Update student info      |
| DELETE | `/api/students/:id`    | Delete a student         |

### Attendance

| Method | Endpoint                     | Description                        |
|--------|-------------------------------|------------------------------------|
| GET    | `/api/attendances/today`      | Get today’s attendance list        |
| POST   | `/api/attendances/mark`       | Mark attendance via recognition    |

#### Sample Request to Mark Attendance

```json
POST /api/attendances/mark

{
  "student_number": "20232015",
  "recognized": true
}
```

## 🧾 Model Overview

### Student Model

| Field           | Type   | Notes                      |
|-----------------|--------|----------------------------|
| `name`          | string | Capitalized automatically |
| `student_number`| string | Unique, required           |
| `face_image`    | file   | Managed via ActiveStorage  |

```ruby
validates :student_number, presence: true, uniqueness: true
validates :name, presence: true

before_save :capitalize_name

def capitalize_name
  self.name = name.split.map(&:capitalize).join(" ")
end
```

### Attendance Model

| Field        | Type  | Notes                         |
|--------------|-------|-------------------------------|
| `student_id` | uuid  | Foreign key to student        |
| `date`       | date  | Default: Today                |
| `status`     | bool  | true = present, false = absent |

## 💾 Active Storage Notes

Make sure Active Storage is using Disk service. All face images are uploaded using multipart/form-data requests with the `face_image` key.

For external services (like Python script) to access image URLs, set:

```ruby
Rails.application.routes.default_url_options[:host] = 'localhost:3000'
ActiveStorage::Current.url_options = Rails.application.routes.default_url_options
```

## 🧪 Testing (Optional)

```bash
bundle exec rspec
```

## 👨‍💻 Developed by

**Salih İmran Büker**  
Junior Ruby Backend Developer  
📍 Istanbul, Turkey  
📧 salihimranbuker44@gmail.com

**Ali Serhat Aslan**
Software Engineer Student
📍 Istanbul, Turkey 
📧 serhathe0@gmail.com

**Melih Can**
Software Engineer Student
📍 Istanbul, Turkey 
📧 melihcann3@outlook.com

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

