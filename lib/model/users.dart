class Users {
  //atributos
  String _nome = "";
  String _senha = "";
  String _email = "";

  Users();

  //getters e setters
  String get nome => _nome;

  set nome(String value) => _nome = value;

  get senha => _senha;

  set senha(value) => _senha = value;

  get email => _email;

  set email(value) => _email = value;
}
