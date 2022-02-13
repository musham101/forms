List<String> fullNameArr = List<String>.filled(5, '');
List<String> userNameArr = List<String>.filled(5, '');
List<String> passwordArr = List<String>.filled(5, '');
List<String> emailArr = List<String>.filled(5, '');

int index = 0;
int max = 5;



class User{
  String fullName;
  String username;
  String email;
  String password;
  User([this.fullName = '',this.username = '', this.email = '', this.password = '']);
  User.n(this.fullName, this.username, this.email, this.password);

  setName(String fullName){
    this.fullName = fullName;
  }
  setUsername(String username){
    this.username = username;
  }
  setEmail(String email){
    this.email = email;
  }
  setPassword(String password){
    this.password = password;
  }
  bool submit(){
    if(index < max){
      fullNameArr[index] = fullName;
      userNameArr[index] = username;
      emailArr[index] = email;
      passwordArr[index] = password;
      index++;
      return true;
    }
    else{
      return false;
    }
  }
}
