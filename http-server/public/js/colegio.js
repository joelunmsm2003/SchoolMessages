  host = "http://localhost:8000"

module.controller("Colegio", function($scope,$http,$rootScope,$location,$localStorage) {


$http.get(host+"/colegios/").success(function(response) {$scope.colegios = response;

    console.log('colegios',$scope.colegios)
   
});

$http.get(host+"/datos/").success(function(response) {$scope.user = response;

    console.log('user',$scope.user)
   
});




$http.get(host+"/useralumno/").success(function(response) {$scope.useralumnos = response;

    console.log('alumnos user',$scope.useralumnos)
   
});

$http.get(host+"/niveles/").success(function(response) {$scope.niveles = response;

    console.log('niveles',$scope.niveles)
   
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



    $scope.addcolegio = function (data) {

        console.log('data',data)

          $('#colegio').modal('hide')
        $('.modal-backdrop').remove();



        $http({

        url: host+"/addcolegio/",
        data: data,
        method: 'POST'

        }).
        success(function(data) {

            //swal({  title: 'Colegio '+data+' ingresado ',  type: "success",  timer: 1200,   showConfirmButton: false });



            $http.get(host+"/colegios/").success(function(response) {$scope.colegios = response;

                console.log('colegios',$scope.colegios)
               
            });



        })

        
        }











});
