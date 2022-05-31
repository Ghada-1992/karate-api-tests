function fn() {

    var env = karate.env; // get java system property 'karate.env'
    karate.log('karate.env selected environment was:', env);
    if (!env) {
        env = 'qa';
    }

    karate.configure('ssl', true)

    var config = {
        env: env,
        baseUrl: 'https://petstore.swagger.io'
    };

    karate.configure('connectTimeout', 60000);
    karate.configure('readTimeout', 60000);

    return config;
}