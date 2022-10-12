import 'lesson.dart';

class LessonList {

  // Types:
  // 1: Theory
  // 2: Driving
  // 3: Manøvrebane
  // 4: Theory-Test
  // 5: Wet-Track
  // 6: Driving-Test

  static final List<Lesson> lessonList = [
    Lesson('Lesson 1', 'Theory 1', 'notes 1', 1),
    Lesson('Lesson 2', 'Theory 2', 'notes 2', 1),
    Lesson('Lesson 3', 'Obstacle course', 'notes 3', 3),
    Lesson('Lesson 4', 'Theory 3', 'notes 4', 1),
    Lesson('Lesson 5', 'Driving 1', 'notes 5', 2),
    Lesson('Lesson 6', 'Theory 4', 'notes 6', 1),
    Lesson('Lesson 7', 'Driving 2', 'notes 7', 2),
    Lesson('Lesson 8', 'Theory 5', 'notes 8', 1),
    Lesson('Lesson 9', 'Driving 3', 'notes 9', 2),
    Lesson('Lesson 10', 'Theory 6', 'notes 10', 1),
    Lesson('Lesson 11', 'Driving 4', 'notes 11', 2),
    Lesson('Lesson 12', 'Theory 7', 'notes 12', 1),
    Lesson('Lesson 13', 'Driving 5', 'notes 13', 2),
    Lesson('Lesson 14', 'Theory 8', 'notes 14', 1),
    Lesson('Lesson 15', 'Driving 6', 'notes 15', 2),
    Lesson('Lesson 16', 'Theory 9', 'notes 16', 1),
    Lesson('Lesson 17', 'Driving 7', 'notes 17', 2),
    Lesson('Lesson 18', 'Driving 8', 'notes 18', 2),
    Lesson('Lesson 19', 'Theory 10', 'notes 19', 1),
    Lesson('Theory test', '', 'notes 20', 4),
    Lesson('Lesson 20', 'Driving 9', 'notes 21', 2),
    Lesson('Lesson 21', 'Wet Track', 'notes 22', 5),
    Lesson('Driving Test', '', 'notes 23', 6  ),



  ];

  static final Map<int, Lesson> lessonMap = {
    1: lessonList[0],
    2: lessonList[1],
    3: lessonList[2],
    4: lessonList[3],
    5: lessonList[4],
    6: lessonList[5],
    7: lessonList[6],
    8: lessonList[7],
    9: lessonList[8],
    10: lessonList[9],
    11: lessonList[10],
    12: lessonList[11],
    13: lessonList[12],
    14: lessonList[13],
    15: lessonList[14],
    16: lessonList[15],
    17: lessonList[16],
    18: lessonList[17],
    19: lessonList[18],
    20: lessonList[19],
    21: lessonList[20],
    22: lessonList[21],
    23: lessonList[22],
  };
}