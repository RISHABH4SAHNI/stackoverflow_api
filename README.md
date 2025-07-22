
# StackOverflow API

A simple RESTful API built with Ruby on Rails that mimics core Stack Overflow functionality. This project allows users to create questions, answer them, and upvote both questions and answers. All endpoints are tested and ready for integration with frontend clients or third-party applications.

## Features

- **Questions**
  - List all questions
  - Create a new question
  - Upvote a question

- **Answers**
  - List all answers for a question
  - Create an answer for a question
  - Upvote an answer

## API Endpoints

### Questions

| Method | Endpoint                  | Description                |
|--------|---------------------------|----------------------------|
| GET    | `/questions`              | List all questions         |
| POST   | `/questions`              | Create a new question      |
| POST   | `/questions/:id/upvote`   | Upvote a question          |

### Answers

| Method | Endpoint                                 | Description                        |
|--------|------------------------------------------|------------------------------------|
| GET    | `/questions/:question_id/answers`        | List all answers for a question    |
| POST   | `/questions/:question_id/answers`        | Create an answer for a question    |
| POST   | `/answers/:id/upvote`                    | Upvote an answer                   |

## Project Structure

- `app/models/` — ActiveRecord models for `Question` and `Answer`
- `app/controllers/` — RESTful controllers for questions and answers
- `db/migrate/` — Database migrations for questions and answers tables
- `config/routes.rb` — API routes as described above
- `test/` — Unit and controller tests

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/stackoverflow_api.git
   cd stackoverflow_api
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up the database**
   ```bash
   rails db:create db:migrate db:seed
   ```

4. **Run the server**
   ```bash
   rails server
   ```

5. **Test the API**
   - Use Postman or any API client to interact with the endpoints listed above.

## Example Request

**Create a Question**
```http
POST /questions
Content-Type: application/json

{
  "title": "How do I use Ruby on Rails?",
  "body": "I'm new to Rails. Can someone explain the basics?"
}
```

**Upvote an Answer**
```http
POST /answers/1/upvote
```

## Technologies Used

- Ruby on Rails
- SQLite3 (default, can be changed)
- RSpec / Minitest for testing

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](LICENSE)
