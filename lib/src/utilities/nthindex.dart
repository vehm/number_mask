int nthIndex(String str, String ch, int n) {
  int pos = -1;
  while (n-- > 0 && (pos = str.indexOf(ch, pos + 1)) != -1) {}
  return pos;
}
