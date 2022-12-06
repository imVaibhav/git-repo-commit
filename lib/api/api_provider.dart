import 'package:http/http.dart' as http;

class ApiProvider {
  static ApiProvider _provider;
  var defaultHeader = {
    'X-XSS-Protection': '1; mode=block',
    'Content-Security-Policy': "script-src 'self'",
    'X-Content-Type-Options': 'nosniff',
    'X-Frame-Options': 'Deny/sameorigin',
  };

  static ApiProvider getInstance() {
    if (_provider == null) {
      _provider = ApiProvider();
    }
    return _provider;
  }

  Future<http.Response> getGitRepos() => http.get(
        Uri.parse('https://api.github.com/users/freeCodeCamp/repos'),
      );

  Future<http.Response> getGitRepoDetails(String repoName, String user) =>
      http.get(
        Uri.parse('https://api.github.com/repos/$user/$repoName/commits'),
      );
}
