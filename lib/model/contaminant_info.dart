class ContaminantInfo {
  final String id;
  final String name;
  final List<dynamic> acceptableRange;
  final List<dynamic> paragraphs;

  const ContaminantInfo(
      {this.id, this.acceptableRange, this.name, this.paragraphs});

  ContaminantInfo.fromMap(Map<String, dynamic> data, String id, String name)
      : this(
            id: id,
            acceptableRange: data['acceptable_range'],
            name: name,
            paragraphs: data['text']);

  String toString() {
    return "Name: " +
        this.name +
        "\n" +
        "Range: [" +
        this.acceptableRange[0].toString() +
        "," +
        this.acceptableRange[1].toString() +
        "]" +
        this.paragraphs[0];
  }
}
