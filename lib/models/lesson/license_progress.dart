class LicenseProgress {
  static  List<int> progressList = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];

  static void addCompleted(int lesson) {
    progressList[lesson] = 1;
  }

  static int getNextIncomplete() {
    int next = -1;
    for(int i = 0; i < progressList.length; i++){
      if(progressList[i] == 0){
        next = i+1;
        break;
      }
    }
    return next;
  }
}
