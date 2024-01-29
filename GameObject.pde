class FGameObject extends FBox {
  final int L = -1;
  final int R = 1;
  //1.5*gridSize, 2.56*gridSize
  FGameObject() {
    super(1.5*gridSize,2.56* gridSize);
  }

FGameObject(int mult) {
  super(mult*gridSize, mult* gridSize);
}

  void  act() {
  }

  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i ++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n))
        return true;
    }

    return false;
  }
}
