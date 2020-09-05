class ContaminantReport {
  final String name;
  final String unitAbbreviation;
  final double concentration;
  final double upperBound;
  final double lowerBound;

  const ContaminantReport(
      {this.name,
      this.concentration,
      this.upperBound,
      this.lowerBound,
      this.unitAbbreviation});
}
