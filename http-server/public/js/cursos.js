  host = "http://localhost:8000"

module.controller("Cursos", function($scope,$http,$routeParams,$rootScope,$location,$localStorage) {


$scope.alumno = $routeParams.alumno



$http.get(host+"/datos/").success(function(response) {$scope.user = response;

    console.log('user',$scope.user)
   
});


$http.get(host+"/cursos/"+$scope.alumno+'/').success(function(response) {$scope.cursos = response;

    console.log('cursos',$scope.cursos)
   
});



});
