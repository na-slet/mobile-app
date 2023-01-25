enum EventType {
  scout('SCOUT', 'Следопытский'),
  teenager('TEENAGER', 'Подростковый'),
  family('FAMILY', 'Семейный'),
  junior('JUNIOR', 'Молодежный');

  final String val;
  final String name;
  const EventType(this.val, this.name);
}
