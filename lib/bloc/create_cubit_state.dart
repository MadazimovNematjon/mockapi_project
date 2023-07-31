
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post_model.dart';
import '../service/network.dart';
import 'create_state.dart';

class CreatePostCubit extends Cubit<CreateState>{
  CreatePostCubit() : super(CreateInit());
  
  void apiPostCreate(Post post)async{
    emit(CreateLoading()); 
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if(response != null){
      emit(CreateLoaded(isCreated: true));
    }else{
      emit(CreateError(error: "cloud not created post"));
    }
  }
}