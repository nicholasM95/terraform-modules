function handler(event) {
    var request = event.request;
    var headers = request.headers;
    var uri = request.uri;

    var authHeader = headers['authorization'];
    var encodedCredentials = '${var.basic_auth_username_password}';

    if (authHeader && authHeader.value === 'Basic ' + encodedCredentials) {
        if (uri.endsWith('/')) {
            request.uri += 'index.html';
        }
        else if (!uri.includes('.')) {
            request.uri += '/index.html';
        }
        return request;
    }

    return {
        statusCode: 401,
        statusDescription: 'Unauthorized',
        headers: {
            'www-authenticate': {
                value: 'Basic realm="Secure Area"'
            }
        }
    };
}