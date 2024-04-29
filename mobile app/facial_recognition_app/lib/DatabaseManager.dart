class Database {
  static final Database _instance = Database._internal();
  factory Database() => _instance;
  Database._internal();

  void connectToDatabase() {
    
    print('Connected to database');
  }

  
}
