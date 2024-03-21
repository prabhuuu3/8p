<!DOCTYPE html>
<html ng-app="myApp">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AngularJS CRUD Application for users</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.9/angular.min.js"></script>

</head>
<body ng-controller="UserController">
    <h1>User Management</h1>
    <table border="1">
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
    </thead>
    <tr ng-repeat="user1 in users">
        <td>{{user1.name}}</td>
        <td>{{user1.email}}</td>
        <td>
            <button ng-click="editUser(user1)">Edit</button>
            <button ng-click="deleteUser(user1)">delete</button>
        </td>
    </tr>
</table>
<hr>
<h2>Create Users</h2>
<input type="text" ng-model="newUser.name" placeholder="Name">
<input type="email" ng-model="newUser.email" placeholder="Email">
<button ng-click="createUser()">Create</button>
<hr>

<h2>Edit User</h2>
<input type="text" ng-model="editedUser.name" placeholder="Name">
<input type="email" ng-model="editedUser.email" placeholder="Email">
<button ng-click="updateUser()">Update</button>
<script src="lll.js"></script>

</body>
</html>
var app = angular.module('myApp', []);

app.controller('UserController', function ($scope) {
    $scope.users = [
        { name: 'Rahul', email: 'rahul@gmail.com' },
        { name: 'Raksha Prabhu', email: 'Rakshabhoombhoom@gmail.com' }
    ];

    $scope.newUser = {};

    $scope.createUser = function () {
        $scope.users.push($scope.newUser);
        $scope.newUser = {};
    };

    $scope.editUser = function (user) {
        $scope.editedUser = user;
    };

    $scope.updateUser = function (user) {
        $scope.editedUser = {};
    };

    $scope.deleteUser = function (user) {
        $scope.users.splice($scope.users.indexOf(user), 1);
    };
});




9 prog


<!DOCTYPE html>
<html ng-app="employeeApp">

<head>
  <title>Employee List</title>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</head>

<body ng-controller="EmployeeController">

  <h2>Employee List</h2>

  <label>Search by Name:</label>
  <input type="text" ng-model="searchName" />
  
  <label>Search by Salary:</label>
  <input type="number" ng-model="searchSalary" />

  <button ng-click="searchEmployees()">SearchName</button>
  <button ng-click="searchEmployees1()">SearchSalary</button>
  <ul>
    <li ng-repeat="employee in filteredEmployees">
      {{ employee.name }} - {{ employee.salary}}
    </li>
  </ul>

  <script src="ddd.js">
    
  </script>

</body>

</html>
angular.module('employeeApp', [])
      .controller('EmployeeController', function ($scope) {
        $scope.employees = [
          { name: 'Rahul K Prabhu', salary: 50000 },
          { name: 'Rakshan', salary: 60000 },
          { name: 'Makvin', salary: 70000 },
          { name: 'Nikola Tesla', salary: 55000 },
          { name: 'Anoop Prabhu', salary: 80000 }
        ];

        $scope.filteredEmployees = $scope.employees;

        $scope.searchEmployees = function () {
          $scope.filteredEmployees = $scope.employees.filter(function (employee) {
            return (
              (employee.name.toLowerCase().includes($scope.searchName.toLowerCase()) || !$scope.searchName) &&
              (employee.salary == $scope.searchSalary || !$scope.searchSalary)
            ); 
          });
        };
        

        $scope.searchEmployees1 = function () {
          $scope.filteredEmployees = $scope.employees.filter(function (employee) {
            return (
              
              (employee.salary == $scope.searchSalary || !$scope.searchSalary)
            ); 
          });
        };
      });





      12 prog

      <!DOCTYPE html>
<html >
<head>
    <title>AngularJS Date Display</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</head>
<body ng-app="myApp">

<div ng-controller="myController">
    <h2>Date Display</h2>

    <label>Date Format:
        <select ng-model="selectedFormat" ng-change="updateDate()">
            <option value="fullDate">Full Date</option>
            <option value="shortDate">Short Date</option>
            <option value="mediumTime">Medium Time</option>
            <option value="shortTime">short Time</option>
            <option value="yyyy-MM-dd HH:mm:ss">Custom Format (yyyy-MM-dd     HH:mm:ss)</option>
        </select>
    </label>

    <p>Selected Date Format: {{ selectedFormat }}</p>
    <p>Formatted Date: {{ formattedDate }}</p>
</div>
<script src="program12.js"></script>

</body>
</html>
var app = angular.module('myApp', []);
app.controller('myController', function ($scope, $filter) {
    $scope.selectedFormat = 'fullDate'; // Default date format
    $scope.updateDate = function () {
        var currentDate = new Date();
        $scope.formattedDate = $filter('date')(currentDate, $scope.selectedFormat);
    };
    // Initial date update
    $scope.updateDate();
});
