Table reviewTable;
userInput userText, searchBar;
LinePlot lineplot;
background backgroundTemplate;
//BarChartIndividual barChart;
PImage starImage;
StarCounter starCounter;
VScrollbar vs1;
int[] reviewCount;
String[] reviews;
Review testReview, nextReview;
ArrayList<Review> reviewsArray;
ArrayList<String> businessNames, userNames;
ArrayList<LinePlot> linePlotArray;
ArrayList<Integer> userEvents;
int reviewNumDisplayed =0;
int screenInt = 1;
Widget widgetNext, widgetPrev, bizWidget, userWidget, reviewWidget, userWij, bizWij, mostRecent, topRated;
ArrayList<Widget> widgetList, otherWij, bizWidgets, homeWij, userWijList;
PFont widgetFont;
float y = 100;
Screen currentScreen, businessScreen, userScreen;
HomeScreen currntscrn, homeScreen;
ReviewScreen currScreen, reviewScreen;
UserScreen cScreen, userProfile;
color widgetColor;
void setup () {

  reviewCount=new int[11];
  starImage=loadImage("star.gif");
  widgetColor = color(56, 90, 94);
  reviewTable=loadTable("reviews_cleaned.csv", "header");
  size(1800, 1000);
  // reviewTable = loadTable("reviews_cleaned.csv", "header");
  vs1 = new VScrollbar(SCREEN_X, 0, SCROLLWIDTH, SCROLLHEIGHT, 3*5+1);
  widgetFont = loadFont("SansSerif-14.vlw"); 
  textFont(widgetFont);
  widgetNext =new Widget(924, 600, 100, 40, 
    "Next", widgetColor, widgetFont, EVENT_BUTTON1);
  widgetPrev = new Widget(700, 600, 100, 40, "Previous", widgetColor, widgetFont, EVENT_BUTTON2);
  bizWidget = new Widget(524, 0, 100, 110, "Businesses", widgetColor, widgetFont, EVENT_BUTTON3);
  userWidget = new Widget(648, 0, 100, 110, "Users", widgetColor, widgetFont, EVENT_BUTTON4);
  reviewWidget = new Widget(400, 0, 100, 110, "Home", widgetColor, widgetFont, EVENT_BUTTON5);
  mostRecent = new Widget(772, 0, 100, 110, "Recent", widgetColor, widgetFont, EVENT_BUTTON8);
  topRated = new Widget(896, 0, 100, 110, "Top", widgetColor, widgetFont, EVENT_BUTTON9);
  Widget busWidget1 = new Widget(500, 200, 200, 40, "Carini's", widgetColor, widgetFont, EVENT_BUTTON10);
  Widget busWidget2 = new Widget(500, 250, 200, 40, "Quicktrip", widgetColor, widgetFont, EVENT_BUTTON11);
  Widget busWidget3 = new Widget(500, 300, 200, 40, "Barrio Fiesta", widgetColor, widgetFont, EVENT_BUTTON12);
  Widget busWidget4 = new Widget(500, 350, 200, 40, "Sally Beauty", widgetColor, widgetFont, EVENT_BUTTON13);
  Widget busWidget5 = new Widget(500, 400, 200, 40, "Phoenix Pharmacy", widgetColor, widgetFont, EVENT_BUTTON14);
  Widget busWidget6 = new Widget(500, 450, 200, 40, "Impact Auto", widgetColor, widgetFont, EVENT_BUTTON15);
  Widget busWidget7 = new Widget(500, 500, 200, 40, "Liberty", widgetColor, widgetFont, EVENT_BUTTON16);
  Widget busWidget8 = new Widget(500, 550, 200, 40, "Plantation Animal", widgetColor, widgetFont, EVENT_BUTTON17);
  Widget busWidget9 = new Widget(500, 600, 200, 40, "Super Star", widgetColor, widgetFont, EVENT_BUTTON18);
  Widget busWidget10 = new Widget(950, 200, 200, 40, "Capriotti's", widgetColor, widgetFont, EVENT_BUTTON19);
  Widget busWidget11 = new Widget(950, 250, 200, 40, "Cool Springs", widgetColor, widgetFont, EVENT_BUTTON20);
  Widget busWidget12 = new Widget(950, 300, 200, 40, "Peoria Nissan", widgetColor, widgetFont, EVENT_BUTTON21);
  Widget busWidget13 = new Widget(950, 350, 200, 40, "Cafe Presse", widgetColor, widgetFont, EVENT_BUTTON22);
  Widget busWidget14 = new Widget(950, 400, 200, 40, "Fresh & Easy", widgetColor, widgetFont, EVENT_BUTTON23);
  Widget busWidget15 = new Widget(950, 450, 200, 40, "Office Team", widgetColor, widgetFont, EVENT_BUTTON24);
  Widget busWidget16 = new Widget(950, 500, 200, 40, "Foreign Fix", widgetColor, widgetFont, EVENT_BUTTON25);
  Widget busWidget17 = new Widget(950, 550, 200, 40, "Dollarama", widgetColor, widgetFont, EVENT_BUTTON26);
  Widget busWidget18 = new Widget(950, 600, 200, 40, "McDonald's", widgetColor, widgetFont, EVENT_BUTTON27);
  Widget busWidget19 = new Widget(950, 650, 200, 40, "Realstar", widgetColor, widgetFont, EVENT_BUTTON28);
  businessNames = new ArrayList<String>();
  userNames = new ArrayList<String>();
  widgetList = new ArrayList<Widget>();
  otherWij = new ArrayList<Widget>();
  bizWidgets = new ArrayList<Widget>();
  homeWij = new ArrayList<Widget>();
  userWijList = new ArrayList<Widget>();
  userEvents = new ArrayList<Integer>();

  otherWij.add(widgetNext); 
  otherWij.add(widgetPrev);
  widgetList.add(bizWidget);

  widgetList.add(userWidget);
  widgetList.add(reviewWidget);
  widgetList.add(mostRecent);
  widgetList.add(topRated);
  widgetList.add(widgetNext);
  widgetList.add(widgetPrev);

  bizWidgets.add(userWidget);
  bizWidgets.add(bizWidget);
  bizWidgets.add(reviewWidget);
  bizWidgets.add(mostRecent);
  bizWidgets.add(topRated);
  bizWidgets.add(busWidget1);
  bizWidgets.add(busWidget2);
  bizWidgets.add(busWidget3);
  bizWidgets.add(busWidget4);
  bizWidgets.add(busWidget5);
  bizWidgets.add(busWidget6);
  bizWidgets.add(busWidget7);
  bizWidgets.add(busWidget8);
  bizWidgets.add(busWidget9);
  bizWidgets.add(busWidget10);
  bizWidgets.add(busWidget11);
  bizWidgets.add(busWidget12);
  bizWidgets.add(busWidget13);
  bizWidgets.add(busWidget14);
  bizWidgets.add(busWidget15);
  bizWidgets.add(busWidget16);
  bizWidgets.add(busWidget17);
  bizWidgets.add(busWidget18);
  bizWidgets.add(busWidget19);

  userWijList.add(userWidget);
  userWijList.add(bizWidget);
  userWijList.add(reviewWidget);
  userWijList.add(mostRecent);
  userWijList.add(topRated);

  reviewsArray = new ArrayList<Review>();
  linePlotArray = new ArrayList<LinePlot>();

  reviews = loadStrings("reviews_cleaned.csv");
  userText = new userInput(400, 500, 600);
  backgroundTemplate = new background();
  searchBar = new userInput(1200, 30, 220);

  homeWij.add(widgetNext);
  homeWij.add(widgetPrev);
  homeWij.add(bizWij);
  homeWij.add(userWij);
  homeWij.add(topRated);
  homeWij.add(mostRecent);
  businessScreen = new Screen(bizWidgets, backgroundTemplate);


  /*  businessScreen.addWidget2(busWidget1);
   businessScreen.addWidget2(busWidget2);
   businessScreen.addWidget2(busWidget3);
   businessScreen.addWidget2(busWidget4);
   businessScreen.addWidget2(busWidget5);
   businessScreen.addWidget2(busWidget6);
   businessScreen.addWidget2(busWidget7);
   businessScreen.addWidget2(busWidget8);
   businessScreen.addWidget2(busWidget9);
   businessScreen.addWidget2(busWidget10);
   businessScreen.addWidget2(busWidget11);
   businessScreen.addWidget2(busWidget12);
   businessScreen.addWidget2(busWidget13);
   businessScreen.addWidget2(busWidget14);
   businessScreen.addWidget2(busWidget15);
   businessScreen.addWidget2(busWidget16);
   businessScreen.addWidget2(busWidget17);
   businessScreen.addWidget2(busWidget18);
   businessScreen.addWidget2(busWidget19);*/

  currntscrn = homeScreen;
  println("there are " + reviews.length + " lines");
  for (int i = 1; i < reviewTable.getRowCount(); i++) {
    TableRow row=reviewTable.getRow(i);
    String userID = row.getString("user_id");
    String userName = row.getString("user_name");
    String businessID = row.getString("business_id");
    String businessName = row.getString("business_name");
    int stars = row.getInt("stars");
    String date=row.getString("date");
    String review = row.getString("text");
    int useful = row.getInt("useful");
    int funny = row.getInt("funny");
    int cool = row.getInt("cool");
    int i2=i;
    Review newReview = new Review(userID, userName, businessID, businessName, stars, date, review, useful, funny, cool, i2);
    reviewsArray.add(newReview);
  }
  //for (int i = 1; i < reviewTable.getRowCount(); i++) {
  // TableRow row = reviewTable.getRow(i);
  // String name = row.getString("business_name");
  // businessNames.add(name);
  // }
  // for (int i = 1; i < reviewTable.getRowCount(); i++) {
  // TableRow row = reviewTable.getRow(i);
  // String name = row.getString("user_name");
  // userNames.add(name);
  // }
  for (int i = 1; i < reviewsArray.size(); i++) {
    Review testReview = (Review) reviewsArray.get(i);
    String name = testReview.getBusinessName();
    if (!businessNames.contains(name) ) {
      businessNames.add(name);
    }
  }
  for (int i = 1; i < reviewsArray.size(); i++) {
    Review testReview = (Review) reviewsArray.get(i);
    String name = testReview.getUserName();
    if (!userNames.contains(name)) {
      println(name);
      userNames.add(name);
    }
  }
  // username widgets event button arraylist 
  for (int i = 30; i < 105; i++) {
    userEvents.add(i);
  }
  println("there are " + userEvents.size() + " user event buttons");
  for (int i = 0; i < userNames.size(); i++) {
    if (i < 10) {
      Widget wij = new Widget(400, 200 + (50*i), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >= 10 && i < 20) {
      Widget wij = new Widget(600, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >=30 && i < 40) {
      Widget wij = new Widget(800, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >= 50 && i < 60) {
      Widget wij = new Widget(1000, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >= 70 && i < 75) {
      Widget wij = new Widget(1200, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    }
  }

  println("There are " + userNames.size() + " names");
  if (reviewNumDisplayed < 0) {
    reviewNumDisplayed = 0;
  }

  int[] statistics=findReviews(reviewsArray.get(0).getBusinessName());
  lineplot=new LinePlot(50, 60, 10, 100, 900, 700, 500, "Review Activity", "Years", "Reviews", 1, 11, 10, 4, statistics);
  Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  reviewScreen = new ReviewScreen (widgetList, backgroundTemplate, reviewsArray, reviewNumDisplayed, lineplot);
  userScreen = new Screen(userWijList, backgroundTemplate);
  homeScreen = new HomeScreen(homeWij, backgroundTemplate, userText);
  currScreen = reviewScreen;

  //  barChart=new BarChartIndividual(nextReview);

  // testReview = (Review) reviewArray.get(1);
  // nextReview = (Review) reviewArray.get(2);
  //  println(testReview.getUserName());
  // println(testReview.getBusinessName());
  //println(testReview.getReview());
  //println(nextReview.getReview());
}

void draw() {
  // float leftPos = vs1.getPos();
  //backgroundTemplate.draw();
  if (screenInt == 1) {
    currScreen.draw();
  } else if (screenInt == 2 || screenInt == 3) {
    currentScreen.draw();
  } else if (screenInt >= 30 && screenInt < 106) {
    cScreen.draw();
  }
  searchBar.draw();
  //vs1.display();
  //  barChart.draw(800);
  // starCounter.draw(200);
  // lineplot.draw();
  // nextReview = (Review) reviewsArray.get(1);
  // nextReview.draw(-leftPos + 200);
  // testReview.draw(leftPos);
  // nextReview.draw(leftPos + 200);
  /*for ( int i =0; i < widgetList.size(); i ++) {
   Widget aWidget = (Widget) widgetList.get(i);
   aWidget.draw();
   } */
  // Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  // nextReview.draw(200);
  int event;
}
int[] findReviews(String businessName) {//gets how many reviews the business got in each year, returns integer array.
  Review currentReview;
  String nameCompared;
  businessName=getRidOfQuotation(businessName);
  for (int i=0; i<reviewsArray.size(); i++) {
    currentReview=reviewsArray.get(i);
    nameCompared= getRidOfQuotation(currentReview.getBusinessName());
    if (businessName.equals(nameCompared)) {
      String date=currentReview.getDate();
      int reviewsYear=getYearFromDate(date);
      switch(reviewsYear) {
      case 2007:
        reviewCount[0]++;
        println(reviewCount[0]);
        break;
      case 2008:
        reviewCount[1]++;
        println(reviewCount[0]);
        break;
      case 2009:
        reviewCount[2]++;
        println(reviewCount[0]);
        break;
      case 2010:
        reviewCount[3]++;
        println(reviewCount[0]);
        break;
      case 2011:
        reviewCount[4]++;
        println(reviewCount[0]);
        break;
      case 2012:
        reviewCount[5]++;
        println(reviewCount[0]);
        break;
      case 2013:
        reviewCount[6]++;
        println(reviewCount[0]);
        break;
      case 2014:
        reviewCount[7]++;
        println(reviewCount[7]);
        break;
      case 2015:
        reviewCount[8]++;
        println(reviewCount[8]);
        break;
      case 2016:
        reviewCount[9]++;
        println(reviewCount[9]);
        break;
      case 2017:
        reviewCount[10]++;
        println(reviewCount[10]);
        break;
      }
    }
  }
  // for (int i=0; i<reviewCount.length; i++) {
  //  println(reviewCount[i]);
  //}
  return reviewCount;
}

int getYearFromDate(String date) {
  char[]dateToChars=date.toCharArray();
  int index2=dateToChars.length-1;
  char[] flipped=new char[4];
  int counter=0;
  for (int index=index2; index>dateToChars.length-5; index--) {
    char c=dateToChars[index];
    flipped[counter]=c;
    counter++;
  }
  int i2=3;
  char[]fliperoo=new char[4];
  for (int i=0; i<flipped.length; i++) {
    fliperoo[i]=flipped[i2];
    i2--;
  }
  String yearString=new String(fliperoo);
  //println(yearString);
  int year=Integer.parseInt(yearString);
  // println(year);
  return year;
}

String getRidOfQuotation(String text) {
  char[]textToChars=text.toCharArray();
  char[] cleanText=new char[textToChars.length-2];
  int counter=0;
  for (int i=1; i<textToChars.length-1; i++) {
    char c=textToChars[i];
    cleanText[counter]=c;
    counter++;
  } 
  String newString=new String(cleanText);
  //println(newString);
  return newString;
}

void mousePressed() {
  int event;
  for ( int i =0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (reviewNumDisplayed  < 0) {
      reviewNumDisplayed = 0;
    }
    switch(event) {
    case EVENT_BUTTON1:
      println("Next");
      reviewNumDisplayed++;
      break;
    case EVENT_BUTTON2:
      println("Previous");
      reviewNumDisplayed --;
      break;
    case EVENT_BUTTON3:
      println("Businesses");
      screenInt = 2;
      currentScreen = businessScreen;
      break;
    case EVENT_BUTTON4:
      println("Users");
      screenInt = 3;
      currentScreen = userScreen;
      break;
    case EVENT_BUTTON5:
      println("Home");
      screenInt = 1;
      currScreen = reviewScreen;
      break;
    case EVENT_BUTTON8:
      println("Most Recent");
      break;
    case EVENT_BUTTON9:
      println("Top Rated");
      break;
    }
  }
  for (int i =0; i<bizWidgets.size(); i++) {
    Widget aWidget = (Widget) bizWidgets.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (reviewNumDisplayed  < 0) {
      reviewNumDisplayed = 0;
    }
    switch(event) {
    case EVENT_BUTTON10:
      println("One");
      break;
    case EVENT_BUTTON11:
      println("Two");
      break;
    case EVENT_BUTTON12:
      println("Three");
      break;
    case EVENT_BUTTON13:
      println("Four");
      break;
    case EVENT_BUTTON14:
      println("Five");
      break;
    case EVENT_BUTTON15:
      println("Six");
      break;
    case EVENT_BUTTON16:
      println("Seven");
      break;
    case EVENT_BUTTON17:
      println("Eight");
      break;
    case EVENT_BUTTON18:
      println("Nine");
      break;
    case EVENT_BUTTON19:
      println("Ten");
      break;
    case EVENT_BUTTON20:
      println("Eleven");
      break;
    case EVENT_BUTTON21:
      println("Twelve");
      break;
    case EVENT_BUTTON22:
      println("Thirteen");
      break;
    case EVENT_BUTTON23:
      println("Fourteen");
      break;
    case EVENT_BUTTON24:
      println("Fifteen");
      break;
    case EVENT_BUTTON25:
      println("Sixteen");
      break;
    case EVENT_BUTTON26:
      println("Seventeen");
      break;
    case EVENT_BUTTON27:
      println("Eighteen");
      break;
    case EVENT_BUTTON28:
      println("Nineteen");
      break;
    case EVENT_BUTTON29:
      println("Twenty");
      break;
    }
  }
  for (int i = 0; i < userWijList.size(); i++) {
    Widget aWidget = (Widget) userWijList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (event != EVENT_NULL) {
      String username = aWidget.getLabel();
      userProfile = new UserScreen(reviewsArray, widgetList, backgroundTemplate, username); 
      cScreen = userProfile;
      screenInt = event;
    }
  }
}
void keyPressed() {
  userText.userKeyPressed();
}