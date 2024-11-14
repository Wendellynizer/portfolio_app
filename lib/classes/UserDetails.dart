class UserDetails {
  String? uid;
  String? fname;
  String? lname;

  UserDetails(this.uid, this.fname, this.lname);

  String getFullName() {
    return "$fname $lname";
  }
}