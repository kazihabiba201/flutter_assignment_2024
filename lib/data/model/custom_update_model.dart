class CustomModel {
  String paragraphInput;
  String paragraphDescription;
  String paragraphSection;
  DateTime date;
  String location;

  CustomModel({
    required this.paragraphInput,
    required this.paragraphDescription,
    required this.paragraphSection,
    required this.date,
    required this.location,
  });

  @override
  String toString() {
    return 'CustomModel(paragraphInput: $paragraphInput, paragraphDescription: $paragraphDescription, paragraphSection: $paragraphSection, date: $date, location: $location)';
  }
}
