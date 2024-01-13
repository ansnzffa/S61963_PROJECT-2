class MyCourse {
  int id;
  String title;
  String content;
  DateTime modifiedTime;

  MyCourse({
    required this.id,
    required this.title,
    required this.content,
    required this.modifiedTime,
  });
}


List<MyCourse> sampleCourse = [
  MyCourse(
    id: 0,
    title: 'CSM3114 Framework',
    content:
        'I.Lab work\nII.Lecture\nIII.Lab Test\nIV.Quiz',
    modifiedTime: DateTime(2023,1,1,34,5),
  ),
  MyCourse(
    id: 1,
    title: 'CSM3123 Native and Mobile Programming',
    content:
        'I.Lab work\nII.Lecture\nIII.Lab Test\nIV.Quiz',
    modifiedTime: DateTime(2023,7,1,34,5),
  ),
  MyCourse(
    id: 2,
    title: 'CSF3253 Intelligent System',
    content:
         'I.Lab work\nII.Lecture\nIII.Lab Test\nIV.Quiz',
    modifiedTime: DateTime(2023,3,1,19,5),
  ),
  MyCourse(
    id: 3,
    title: 'CSF3233 Cyber Security',
    content:  'I.Lab work\nII.Lecture\nIII.Lab Test\nIV.Quiz',
   modifiedTime: DateTime(2023,8,4,16,53),
  ),
  MyCourse(
    id: 4,
    title: 'BBB3033 EOP',
    content:
         'I.Interview Session\nII.Resume,Cover Letter\nIII.Mock Test\nIV.Quiz',
    modifiedTime: DateTime(2023,5,1,11,6),
  ),
];
