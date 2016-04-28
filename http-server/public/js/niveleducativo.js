  host = "http://localhost:8000"

module.controller("Niveleducativo", function($scope,$http,$routeParams,$rootScope,$location,$localStorage) {

$scope.colegio = $routeParams.colegio

$http.get(host+"/datos/").success(function(response) {$scope.user = response;

    console.log('user',$scope.user)
   
});

$http.get(host+"/colegionivel/"+$scope.colegio+"/").success(function(response) {$scope.niveles = response;

    console.log('niveles',$scope.niveles,$scope.colegios)

    $scope.niveldata = $scope.niveles[0]
   
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
