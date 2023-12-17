import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/product/service/product/product_service.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  late final ProductService productService;

  setUp(() {
    productService = ProductService();
  });

  test(
    'get all products from API',
    () async => {
      expect(await productService.getAllProducts(), isNotNull),
    },
  );
}
