resource "aws_cloudfront_function" "basic_auth_function" {
  count   = var.enable_basic_auth ? 1 : 0
  name    = "BasicAuthFunction"
  runtime = "cloudfront-js-1.0"

  code = <<EOF
function handler(event) {
    var request = event.request;
    var headers = request.headers;

    var authHeader = headers['authorization'];
    var expectedUsername = '${var.basic_auth_username}';
    var expectedPassword = '${var.basic_auth_password}';
    var encodedCredentials = btoa(expectedUsername + ':' + expectedPassword);

    if (authHeader && authHeader.value === 'Basic ' + encodedCredentials) {
        return request;
    }

    return {
        statusCode: 401,
        statusDescription: 'Unauthorized',
        headers: {
            'www-authenticate': [{
                key: 'WWW-Authenticate',
                value: 'Basic realm="Secure Area"'
            }]
        }
    };
}
EOF
}
