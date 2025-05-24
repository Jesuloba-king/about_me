import 'package:http/http.dart' as http;

class ApiService {
  // This class will handle API requests and responses.

  static const String baseUrl = "https://fakestoreapi.com/";

  //loginig in, registering, and managing groceries.
  // https://fakestoreapi.com/
  // auth/login
  // It will include methods for user authentication and grocery management.
  Future<void> loginWithEmail(String email, String password) async {
    final path = Uri.parse("${baseUrl}auth/login");
    final pathurl = Uri.parse("https://fakestoreapi.com/auth/login");

    try {
      // Making a POST / GET / Delete / request to the login endpoint
    } catch (e) {
      // Handle any exceptions that occur during the request
      print("Error during login: $e");
    }
  }

  Future<void> login(String username, String password) async {
    // Logic to handle user login
  }

  // Future<void> register(String username, String password) async {
  //   // Logic to handle user registration
  // }

  // // It will include methods for fetching, adding, updating, and deleting groceries.

  // Future<void> fetchGroceries() async {
  //   // Logic to fetch groceries from the API
  // }

  // Future<void> addGrocery(String item) async {
  //   // Logic to add a grocery item to the API
  // }

  // Future<void> updateGrocery(String itemId, String updatedItem) async {
  //   // Logic to update a grocery item in the API
  // }

  // Future<void> deleteGrocery(String itemId) async {
  //   // Logic to delete a grocery item from the API
  // }
}
