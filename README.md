<h1>Flutter Chat App</h1
>

<h1>Overview</h1>
This Flutter app is a real-time chat application that allows users to log in, view a list of conversations, and chat with other users. The app communicates with a Strapi backend using REST APIs for user authentication and message storage. Socket.IO is used for real-time message exchange.

<h1>Features</h1>
User Login: Users can log in securely with their credentials. User data is stored in a Strapi backend.
Conversation List: Displays a list of conversations. Clicking on a username opens the chat page for that user.
Chat Page: Allows users to send and receive messages in real-time. Messages are stored in the Strapi backend.

<h1>Requirements</h1>
Flutter SDK
Strapi Backend (Ensure Strapi is running before logging in)

<h1>Setup</h1>
Clone this repository:

git clone https://github.com/your-username/flutter-chat-app.git


<h1>Navigate to the project directory:</h1>

cd flutter-chat-app

##Install dependencies:

flutter pub get

##Start the Flutter app:

flutter run

Ensure your Strapi backend is running and accessible.

<h1>Dependencies</h1>
socket_io_client: ^2.0.0
provider: ^6.2.1
http: ^0.13.3

<h1>Usage</h1>
Launch the app on your device or simulator.
Log in with your credentials.
View the list of conversations and click on a username to start chatting.
Send messages in the chat page. Messages are sent to and received from the Strapi backend in real-time.


License
This project is licensed under the MIT License.