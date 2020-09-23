void main() {
  print("main program start");
  printbaba();
  print("main program ends");
}

printbaba() async {
  String as = await dosya();
  print("the content of the file is -->$as");
}

Future<String> dosya() {
  Future<String> newfile = Future.delayed(Duration(seconds: 6), () {
    return "myadaed";
  });
  return newfile;
}
