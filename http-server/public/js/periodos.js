  host = "http://localhost:8000"

module.controller("Periodo", function($scope,$http,$routeParams,$rootScope,$location,$localStorage) {


$scope.alumnouser = $routeParams.alumno


$http.get(host+"/colegios/").success(function(response) {$scope.colegios = response;

    console.log('colegios',$scope.colegios)
   
});

$http.get(host+"/datos/").success(function(response) {$scope.user = response;

    console.log('user',$scope.user)
   
});


$http.get(host+"/periodos/"+$scope.alumnouser+'/').success(function(response) {$scope.periodos = response;

    console.log('periodos',$scope.periodos)
   
});









});
