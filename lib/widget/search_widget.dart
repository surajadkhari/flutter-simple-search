import 'package:flutter/material.dart';

class FilterSearch extends StatefulWidget {
  const FilterSearch({Key? key}) : super(key: key);

  @override
  _FilterSearchState createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  final TextEditingController searchContorller = TextEditingController();
  // @override
  // Widget build(BuildContext context) {
  //   return Container(

  //   );
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      // results = _allUsers
      //     .where(
      //       (user) => user["name"].toLowerCase().contains(
      //             enteredKeyword.toLowerCase(),
      //           ),
      //     )
      //     .toList();
      results = _allUsers
          .where((element) => element["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: searchContorller,
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: IconButton(
                onPressed: () {
                  _runFilter(searchContorller.text);
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _foundUsers.isNotEmpty
              ? SizedBox(
                  height: 400,
                  width: 320,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) => Card(
                      key: ValueKey(_foundUsers[index]["id"]),
                      color: Colors.white,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: Text(
                          _foundUsers[index]["id"].toString(),
                          style: const TextStyle(fontSize: 24),
                          // _foundUsers[index]['age'].toString(),
                        ),
                        title: Text(_foundUsers[index]['name']),
                        subtitle: Text(
                            '${_foundUsers[index]["age"].toString()} years old'),
                      ),
                    ),
                  ),
                )
              : const Text(
                  'No results found',
                  style: TextStyle(fontSize: 24),
                ),
        ],
      ),
    );
  }
}
