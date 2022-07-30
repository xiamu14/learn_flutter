import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

export 'graphql/country.req.gql.dart';

Client initClient(String uri) {
  final link = HttpLink(uri);

  final client = Client(link: link);

  return client;
}
