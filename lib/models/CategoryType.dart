enum CategoryType {
  event('EVENT', 'Слет'),
  camp('CAMP', 'Лагерь');

  final String val;
  final String name;
  const CategoryType(this.val, this.name);
}
