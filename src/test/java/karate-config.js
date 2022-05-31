function fn() {

  var config = {
	  baseUrl: 'https://petstore.swagger.io '
  }

  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 60000);

  return config;
}