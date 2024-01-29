class FGameObject2 extends FBox {
  final int L = -1;
  final int R = 1;
  //1.5*gridSize, 2.56*gridSize
  FGameObject2() {
    super(gridSize,gridSize);
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
