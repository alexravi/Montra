# Montra

Montra is a simple and lightweight web application built with Python and Flask framework. It allows users to create, read, update, and delete notes. This project aims to provide a minimalistic and efficient note-taking solution.

## Features

- User registration and authentication: Users can create an account and securely authenticate themselves.
- Create and manage notes: Users can create new notes, view existing notes, update notes, and delete notes.
- Search functionality: Users can search for specific notes using keywords or tags.
- Markdown support: Notes can be written using Markdown syntax for rich text formatting.
- Responsive design: The application is designed to work smoothly across different devices and screen sizes.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/alexravi/montra.git
   ```

2. Change to the project directory:

   ```bash
   cd montra
   ```

3. Create a virtual environment:

   ```bash
   python -m venv venv
   ```

4. Activate the virtual environment:

   - For Windows:

     ```bash
     venv\Scripts\activate
     ```

   - For macOS and Linux:

     ```bash
     source venv/bin/activate
     ```

5. Install the dependencies:

   ```bash
   pip install -r requirements.txt
   ```

6. Set up the database:

   ```bash
   flask db init
   flask db migrate
   flask db upgrade
   ```

7. Start the application:

   ```bash
   flask run
   ```

   The application will be accessible at `http://localhost:5000`.

## Configuration

The application can be configured by modifying the `config.py` file in the project's root directory. Here are some configuration options:

- `SECRET_KEY`: Secret key used for securely signing the session cookie. Make sure to choose a strong, unique key.
- `SQLALCHEMY_DATABASE_URI`: URI for the database connection. By default, it uses SQLite, but you can use other databases supported by SQLAlchemy.
- `MAIL_SERVER`: SMTP server for sending emails for account activation and password reset.
- `MAIL_PORT`: Port number for the SMTP server.
- `MAIL_USE_TLS`: Enable or disable TLS for the SMTP connection.
- `MAIL_USERNAME` and `MAIL_PASSWORD`: Credentials for the SMTP server.
- `UPLOAD_FOLDER`: Path to the folder where file uploads are stored.

Make sure to set the appropriate configuration values before running the application in production.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

Before contributing, please review the [contribution guidelines](CONTRIBUTING.md).

## License

Montra is released under the [MIT License](LICENSE).

## Acknowledgements

Montra was created by Alex Ravi as a personal project and is provided as an open-source application for others to use and learn from. The project utilizes the Flask framework and various other open-source libraries and tools, to which the author expresses gratitude.

Special thanks to the Flask and Python communities for their valuable contributions and support.
