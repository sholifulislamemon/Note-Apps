class NoteModels{

  final String title;
  final String subtitle;
  final DateTime createddate;
  final DateTime? updateddate;

  NoteModels( {
    required this.title,
    required this.subtitle,
    required this.createddate,
    this.updateddate,
  }

      );


}