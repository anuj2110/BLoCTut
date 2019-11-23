class Employee{
  int _id;
  String _name;
  double _salary;

  Employee(this._id,this._name,this._salary);

  //setters

  set id(int id){
    this._id = id;
  }

  set name(String name){
    this._name = name;
  }

  set salary(double salary){
    this._salary = salary;
  }

  //getters

  get id => this._id;
  get name => this._name;
  get salary => this._salary;
}