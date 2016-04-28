  host = "http://localhost:8000"

module.controller("Seccion", function($scope,$http,$routeParams,$rootScope,$location,$localStorage) {

$scope.grado = $routeParams.grado
$scope.nivel = $routeParams.nivel
$scope.colegio = $routeParams.colegio


$http.get(host+"/datos/").success(function(response) {$scope.user = response;

    console.log('user',$scope.user)
   
});

$http.get(host+"/secciongrado/"+$scope.grado+"/").success(function(response) {$scope.secciones = response;

    console.log('secciones',$scope.secciones)
    $scope.secciondata = $scope.secciones[0]
   
});




    $scope.usersave = function (data) {

      console.log('data',data)

       var todo={

            add: "Add",
            dato: data
          
        }


        $http({

        url: host+"/adduser/",
        data: todo,
        method: 'POST'
 
        }).
        success(function(data) {

          swal({  title: 'Usuario ingresado ',  type: "success",  timer: 1200,   showConfirmButton: false });

          $http.get(host+"/useralumno/").success(function(response) {$scope.useralumnos = response;

    console.log('alumnos user',$scope.useralumnos)
   
});



        })
        
        
        }










});
