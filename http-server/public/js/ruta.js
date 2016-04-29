
var module = angular.module("App", ['ngRoute','ngStorage','ngCookies']);



module.config(['$routeProvider','$httpProvider',

    function($routeProvider,$httpProvider) {

        $routeProvider.

            when('/login', {
                templateUrl: 'login.html',
                controller: 'Login'
            }).

            when('/colegio', {
                templateUrl: 'colegio.html',
                controller: 'Colegio'
            }).
            when('/profesores', {
                templateUrl: 'profesores.html',
                controller: 'Colegio'
            }).
            when('/periodos/:alumno', {
                templateUrl: 'periodos.html',
                controller: 'Periodo'
            }).
            when('/niveleducativo/:colegio', {
                templateUrl: 'niveleducativo.html',
                controller: 'Niveleducativo'
            }).
            when('/grados/:nivel/:colegio', {
                templateUrl: 'grado.html',
                controller: 'Grado'
            }).
            when('/secciones/:grado/:nivel/:colegio', {
                templateUrl: 'seccion.html',
                controller: 'Seccion'
            }).
            when('/alumnos/:seccion/:grado/:nivel/:colegio', {
                templateUrl: 'alumno.html',
                controller: 'Alumno'
            }).
            when('/cursos/:alumno', {
                    templateUrl: 'cursos.html',
                    controller: 'Cursos'
                }).
           	 when('/useralumno', {
                    templateUrl: 'useralumno.html',
                    controller: 'Colegio'
                }).

           	 //mobivstrip



            otherwise({
                redirectTo: '/login'
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
