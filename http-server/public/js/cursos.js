  host = "http://localhost:8000"

module.controller("Cursos", function($scope,$http,$routeParams,$rootScope,$location,$localStorage) {


alumno = $routeParams.alumno



$http.get(host+"/datos/").success(function(response) {$scope.user = response;

    console.log('user',$scope.user)
   
});


$http.get(host+"/cursos/"+alumno+'/').success(function(response) {$scope.cursos = response;

    console.log('cursos',$scope.cursos)
   
});



});
