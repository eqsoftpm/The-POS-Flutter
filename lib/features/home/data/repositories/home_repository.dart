
import 'package:connectivity/connectivity.dart';
import 'package:thepos/features/home/data/datasources/home_local_data_source.dart';
import 'package:thepos/features/home/data/datasources/home_remote_data_source.dart';
import 'package:thepos/features/home/data/models/product.dart';

class HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepository(
      {required this.remoteDataSource, required this.localDataSource});

  Future<List<Product>> getProducts() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return localDataSource.getProducts();
    } else {
      return remoteDataSource.getProducts();
    }
  }

  Future<List<Product>> getProductsByGroupId(int groupId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return localDataSource.getProductsByGroupId(groupId);
    } else {
      return remoteDataSource.getProductsByGroupId(groupId);
    }
  }
}
