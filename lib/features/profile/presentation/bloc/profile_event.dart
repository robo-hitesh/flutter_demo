abstract class ProfileEvent {
  ProfileEvent();
}

class ProfileFetchEvent extends ProfileEvent {
  ProfileFetchEvent(this.profileId);
  String profileId;
}
