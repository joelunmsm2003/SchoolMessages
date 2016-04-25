
host = "http://localhost:8000"

module.controller("Login", function($scope,$http,$rootScope,$location,$localStorage) {



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

        $http.get(host+"/datos/").success(function(response) {$scope.datos = response;

        console.log('datos',$scope.datos.nivel)

        if($scope.datos.nivel==6){

            $location.url("/colegio")
        }
        else{


            $location.url("/alumno")
        }


            
        

        });



    
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


        // Build the request object

  

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
