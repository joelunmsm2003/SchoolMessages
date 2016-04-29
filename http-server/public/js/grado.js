  host = "http://localhost:8000"

module.controller("Grado", function($scope,$http,$routeParams,$rootScope,$location,$localStorage) {

$scope.nivel = $routeParams.nivel
$scope.colegio = $routeParams.colegio

$http.get(host+"/datos/").success(function(response) {$scope.user = response;

    console.log('user',$scope.user)
   
});

$http.get(host+"/nivelgrado/"+$scope.nivel+"/").success(function(response) {$scope.grados = response;

    console.log('grados',$scope.grados)

    $scope.gradodata = $scope.grados[0]
   
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
