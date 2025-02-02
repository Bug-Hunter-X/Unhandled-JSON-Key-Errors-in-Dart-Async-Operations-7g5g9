```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Assuming jsonData is a list of maps
      for (final item in jsonData) {
        print(item['name']); //This might throw error if 'name' is missing
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
    //Here the error is not handled properly
    rethrow; //This will propagate error up the call stack
  }
}
```