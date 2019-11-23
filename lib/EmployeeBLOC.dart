//TODO: make imports


//TODO: List of employees


//TODO: Stream Controllers


//TODO: Stream Sink Getter


//TODO: Constructor - data, listen to changes


//TODO: Core Functions


//TODO: dispose


import 'Employee.dart';
import 'dart:async';

class EmployeeBloc{

  // Sink to add in pipe
  // stream to get data from pipe
  // by pipe i mean data flow

  List<Employee> _employeeList = [

    Employee(1, "Employee 1", 10000.0),
    Employee(2, "Employee 2", 20000.0),
    Employee(3, "Employee 3", 30000.0),
    Employee(4, "Employee 4", 40000.0),
    Employee(5, "Employee 5", 50000.0),
    
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  //controllers for increment and decrement

  final _employeeSalaryIncStreamController = StreamController<Employee>();
  final _employeeSalaryDecStreamController = StreamController<Employee>();

  //getters

  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;
  StreamSink<Employee> get employeeIncSink => _employeeSalaryIncStreamController.sink;
  StreamSink<Employee> get employeeDecSink => _employeeSalaryDecStreamController.sink;

  EmployeeBloc(){

    _employeeListStreamController.add(_employeeList);

    _employeeSalaryIncStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee){
    double salary = employee.salary;

    double increase = salary*20/100;

    _employeeList[employee.id-1].salary = salary+increase;

    employeeListSink.add(_employeeList);

  }

  _decrementSalary(Employee employee){
    double salary = employee.salary;

    double decrease = salary*20/100;

    _employeeList[employee.id-1].salary = salary-decrease;

    employeeListSink.add(_employeeList);

  }

  void dispose(){
    _employeeSalaryIncStreamController.close();
    _employeeListStreamController.close();
    _employeeSalaryDecStreamController.close();
  }
  
}
