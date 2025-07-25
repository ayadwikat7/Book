class QuantityController {
  static int increase(int currentQuantity) {
    return currentQuantity + 1;
  }

  static int decrease(int currentQuantity) {
    return currentQuantity > 1 ? currentQuantity - 1 : 1;
  }
}
