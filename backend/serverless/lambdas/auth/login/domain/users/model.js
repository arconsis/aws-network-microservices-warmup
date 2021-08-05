class User {
  constructor({
    id,
    userId,
    firstName,
    lastName,
    userName,
    email,
    password,
    createdAt,
  } = {}) {
    this.id = id;
    this.userId = userId;
    this.firstName = firstName;
    this.lastName = lastName;
    this.userName = userName;
    this.email = email;
    this.password = password;
    this.createdAt = createdAt;
  }
}

module.exports = User;
