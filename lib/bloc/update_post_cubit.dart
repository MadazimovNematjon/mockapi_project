
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockapi_project/bloc/update_post.dart';

import '../model/post_model.dart';
import '../service/network.dart';

class UpdateCubit extends Cubit<UpdatePostState>{
  UpdateCubit() : super(UpdatePostInit());

  void apiUpdate(Post post)async{
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_CREATE+post.id.toString(), Network.paramsCreate(post));
    if(response != null){
      emit(UpdatePostLoaded(isCreated: true));
    }else{
      emit(UpdatePostError(error: "cloud not created post"));
    }
  }
}