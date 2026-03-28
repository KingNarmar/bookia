class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileUpdated extends EditProfileState {}

class EditProfileError extends EditProfileState {
  final String message;
  EditProfileError({this.message = "Update failed. Please try again."});
}

class EditProfileImagePicked extends EditProfileState {}
