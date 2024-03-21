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
