// import 'package:chickens/core/errors/failures.dart';
// import 'package:chickens/core/repos/orders_repo/orders_repo.dart';
// import 'package:chickens/core/services/data_service.dart';
// import 'package:chickens/core/utils/backend_endpoint.dart';
// import 'package:chickens/features/checkout/data/models/order_model.dart';
// import 'package:chickens/features/checkout/domain/entites/order_entity.dart';
// import 'package:dartz/dartz.dart';


// class OrdersRepoImpl implements OrdersRepo {
//   final DatabaseService dataBaseService;

//   OrdersRepoImpl(this.dataBaseService);
//   @override
//   Future<Either<Failure, void>> addOrder(
//       {required OrderInputEntity order}) async {
//     try {
//       var orderModel = OrderModel.fromEntity(order);
//       await dataBaseService.addData(
//         path: BackendEndpoint.addOrder,
//         documentId: orderModel.orderId,
//         data: orderModel.toJson(),
//       );
//       return const Right(null);
//     } catch (e) {
//       return Left(ServerFailure(e.toString()));
//     }
//   }
// }
