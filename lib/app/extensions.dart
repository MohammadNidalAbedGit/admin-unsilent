extension NonNullableString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    }
    return this!; // Return the non-null value
  }
}

extension NonNullableInt on int?{
  int orZero(){
    if(this==null) {
      return 0;
    }
    return this!;
  }

}