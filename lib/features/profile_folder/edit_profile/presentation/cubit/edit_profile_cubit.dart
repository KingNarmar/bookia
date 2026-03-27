import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile_folder/edit_profile/presentation/cubit/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  String image = "";
  void loadInitialData() {
    var profileData = SharedPref.getUserInfo();
    nameController.text = profileData?.name ?? "";
    phoneController.text = profileData?.phone ?? "";
    addressController.text = profileData?.address ?? "";
    image = profileData?.image ?? "";
    emit(EditProfileSuccess());
  }
}
