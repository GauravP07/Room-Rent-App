import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/room.dart';
import '/providers/room_filters.dart';
import '/providers/rooms.dart';
import '/screens/home_screen.dart';
import '/widgets/room_item.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  late RoomFilters _filters;
  List<Room> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filters = const RoomFilters();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _search() async {
    final query = _searchController.text;
    final rooms = Provider.of<Rooms>(context, listen: false);
    var searchResults = await rooms.search(query, filters: _filters);
    setState(() {
      _searchResults = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(MyHomePage.routeName);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search address, city, location',
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                        onSubmitted: (_) => _search(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search_sharp,
                        color: Colors.purple,
                      ),
                      onPressed: _search,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 10.0,
                bottom: 20.0,
              ),
              child: DropdownButton<RoomFilters>(
                elevation: 7,
                isExpanded: true,
                value: _filters,
                onChanged: (value) {
                  setState(() {
                    _filters = value!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: RoomFilters(),
                    child: Text('All'),
                  ),
                  DropdownMenuItem(
                    value: RoomFilters(isBoysHostel: true),
                    child: Text('Boys Only'),
                  ),
                  DropdownMenuItem(
                    value: RoomFilters(isGirlsHostel: true),
                    child: Text('Girls Only'),
                  ),
                  DropdownMenuItem(
                    value: RoomFilters(location: 'Pune'),
                    child: Text('Pune'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _searchResults.isEmpty
                  ? const Center(
                      child: Text('No Results Found'),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final room = _searchResults[index];
                        return RoomItem(id: room.id!);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
