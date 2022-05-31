function fn() {

    var env = karate.env; // get java system property 'karate.env'
    karate.log('karate.env selected environment was:', env);
    if (!env) {
        env = 'qa';
    }

    karate.configure('ssl', true)

    var config = {
        env: env,
        baseUrl: 'https://petstore.swagger.io',
        username: 'qa',
        password: 'aW9iZXlhMjAyMQ==',
        customKarateMethodsClasspath: 'classpath:util/custom-karate-methods.feature'
    };

    karate.configure('connectTimeout', 60000);
    karate.configure('readTimeout', 60000);

    return config;
}