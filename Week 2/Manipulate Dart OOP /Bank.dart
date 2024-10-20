// Dear Teacher you can view my UML by url link in readme thank you for checling my code
class BankAccount {
  int _accountId;
  String _accountOwner;
  double _balance = 0;

  BankAccount(this._accountId, this._accountOwner);

  double get balance => _balance;

  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }

  void printDetails() {
    print(
        'Account ID: $_accountId, Owner: $_accountOwner, Balance: \$$_balance');
  } }

class Bank {
  String name;
  List<BankAccount> _accounts = [];
  Bank(this.name);
  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account._accountId == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }
    var newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');
  print('Initial balance: \$${ronanAccount.balance}');
  ronanAccount.credit(100);
  print('Balance after credit: \$${ronanAccount.balance}');
  ronanAccount.withdraw(50);
  print('Balance after withdrawal: \$${ronanAccount.balance}');

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e);
  }
  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
