
var module = angular.module("App", ['ngRoute','ngStorage']);


module.config(['$routeProvider','$httpProvider',

    function($routeProvider,$httpProvider) {

        $routeProvider.

            when('/', {
                templateUrl: 'index.html',
                controller: 'Todo'
            }).

            when('/nope', {
                templateUrl: 'nope.html',
                controller: 'Todo'
            }).


            otherwise({
                redirectTo: '/queee'
            });


        $httpProvider.interceptors.push(['$q', '$location', '$localStorage', function($q, $location, $localStorage) {
        return {
                'request': function (config) {
                    config.headers = config.headers || {};
                    if ($localStorage.token) {
                        config.headers.Authorization = 'Bearer ' + $localStorage.token;
                    }
                    return config;
                },
                'responseError': function(response) {
                    if(response.status === 401 || response.status === 403) {
                        $location.path('/signin');
                    }
                    return $q.reject(response);
                }
            };
        }]);

    }]);


module.controller("Todo", function($scope,$http,$rootScope,$location,$localStorage) {


  function urlBase64Decode(str) {
        var output = str.replace('-', '+').replace('_', '/');
        switch (output.length % 4) {
            case 0:
                break;
            case 2:
                output += '==';
                break;
            case 3:
                output += '=';
                break;
            default:
                throw 'Illegal base64url string!';
        }
        return window.atob(output);
    }

    function getUserFromToken() {
        var token = $localStorage.token;
        var user = {};
        if (typeof token !== 'undefined') {
            var encoded = token.split('.')[1];
            user = JSON.parse(urlBase64Decode(encoded));
        }
        return user;
    }

     

    $scope.ingresar = function (data) {
        
        console.log('ingresar',data)
        
    

        $http({

        url: "http://localhost:8000/api-token-auth/",
        data: data,
        method: 'POST'
        }).
        success(function(data) {
        
        console.log('returmmm',data.token)

        $localStorage.token = data.token;

        var currentUser = getUserFromToken();
        
        console.log('Decode',currentUser)

    
        })

    };


    $scope.api = function () {

      $http({

        url: "http://localhost:8000/estados/",
        method: 'GET'
        }).
        success(function(data) {
        
          console.log('api',data)
    
        })


    }


        var jwt = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJhOTk1ZDJjYi0yMjY3LTQ0YWUtODAxNi03MjljZTA2YmZmY2EifQ.685gzlezzh7cQ7SU0KYU2G4WXzF_h0F-c55HBYx-ZO8";
        var tokens = ['limaweekend'];
        var profile = 'my_first_profile';

        // Build the request object

        var datac: {
        "app_id": '04a4977a',
        "email": 'joel@gmail.com',
        "password":'123'
        
        }

       $http({

        method: 'POST',
        url: 'https://api.ionic.io/users',
        data: datac

        }).
        success(function(data) {
        
          console.log('login',data)
    
        })


        /*


        var req = {
        method: 'POST',
        url: 'https://api.ionic.io/push/notifications',
        headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + jwt
        },
        data: {
        "tokens": tokens,
        "profile": profile,
        "notification": {
        "title": "Hi",
        "message": "Hello world!",
        "android": {
        "title": "Hey",
        "message": "Hello Android!"
        },
        "ios": {
        "title": "Howdy",
        "message": "Hello iOS!"
        }
        }
        }
        };

        // Make the API call
        
        // Make the API call
        $http(req).success(function(resp){
        // Handle success
        console.log("Ionic Push: Push success", resp);
        }).error(function(error){
        // Handle error 
        console.log("Ionic Push: Push error", error);
        });

        */





});
