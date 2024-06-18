validateTextFields(String value, String type) {
  //if Email
  if (type == 'email') {
    if (value == '') {
      return 'Email is required';
    }
    if (!value.contains('@') || !value.contains('.com')) {
      return 'Invalid email adress';
    }
  }
  //if Password
  if (type == 'password') {
    if (value == '') {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Invalid, Can\'t be less than 6 letters';
    }
    if (value.length > 20) {
      return 'Invalid, can\'t be more than 10 letters';
    }
  }
}
