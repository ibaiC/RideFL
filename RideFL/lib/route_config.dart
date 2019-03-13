import 'package:flutter/material.dart';
import 'package:login/active_map_page.dart';


class RouteConfig extends StatefulWidget {
  RouteConfig({Key key}) : super(key: key);
  @override
  _RouteConfigState createState() => new _RouteConfigState();
}

class _RouteConfigState extends State<RouteConfig> {
  Widget appBarTitle = new Text(
    "Choose Destionations",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";

  _RouteConfigState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  void init() {
    _list = List();
    _list.add("University of Glasgow");
    _list.add("Three Judges");
    _list.add("Kelvingrove Park");
    _list.add("University Library");
    _list.add("Ashton Lane");
    _list.add("Kushion");
    _list.add("Glasgow Green");
    _list.add("HillHead Bookclub");
    _list.add("Mango");
    _list.add("Buchanan Bus Station");
    _list.add("Oran Mor");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _IsSearching ? _buildRouteConfig() : _buildList(),
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton.icon(
          icon: Icon(Icons.done, color: Colors.white),
          label: Text(
            "Save",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActiveMap()),
            );
          },
        )
      ],
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildRouteConfig() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact)).toList();
    } else {
      List<String> _RouteConfig = List();
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _RouteConfig.add(name);
        }
      }
      return _RouteConfig.map((contact) => new ChildItem(contact)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: actionIcon,
        onPressed: () {
          setState(() {
            if (this.actionIcon.icon == Icons.search) {
              this.actionIcon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                autofocus: true,
                controller: _searchQuery,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)),
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Choose Destionations",
        style: new TextStyle(color: Colors.white),
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  var snackBar = SnackBar(content: Text("Location added to Saved Locations"));

  @override
  Widget build(BuildContext context) {
    var locationNotification =
        "Location " + this.name + " added to Saved Locations";
    return new ListTile(
        title: new Text(this.name),
        onTap: () {
          snackBar = SnackBar(
            content: Text(locationNotification),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {},
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        });
  }
}
