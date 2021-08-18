extension Object on String {
  int get splitSlCustom => int.parse(this.split('/').last);
  int get splitEqCustom => int.parse(this.split('=').last);
}
