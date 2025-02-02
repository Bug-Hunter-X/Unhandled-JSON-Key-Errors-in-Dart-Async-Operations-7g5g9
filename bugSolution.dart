```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      for (final item in jsonData) {
        //Properly handle missing keys
        final name = item['name'] ?? 'N/A';
        print('Name: $name');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    //Instead of rethrowing, handle the error gracefully
  }
}
```