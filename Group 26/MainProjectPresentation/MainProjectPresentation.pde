Table reviewTable;  //<>// //<>//
Review review1;
Review review2;
Review review3;
Review review4;
Review review5;
Review review6;
Review review7;
Review review8;
Review review9;
Review review10;
Review review11;
Review review12;
Review review13;
Review review14;
Review review15;
Review review16;
Review review17;
Review review18;
Review review19;
Review review20;
RecentScreen recentScreen, cScreenRecent, ratedScreen,cScreenTopRated;
userInput userText, searchBar;
LinePlot lineplot;
BarChart barChart;
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
ArrayList<BarChart> barChartArray;
ArrayList<Integer> userEvents;
int reviewNumDisplayed =0;
int screenInt = 1;
Widget widgetNext, widgetPrev, bizWidget, userWidget, reviewWidget, userWij, bizWij, mostRecent, topRated;
ArrayList<Widget> widgetList, otherWij, bizWidgets, homeWij, userWijList;
PFont widgetFont;
float y = 100;
Screen currentScreen, businessScreen, userScreen;
HomeScreen currntscrn, homeScreen;
ReviewScreen currScreen, reviewScreen, businessProfile, userProfile;
UserScreen cScreen;
//UserScreen cScreen, userProfile;
color widgetColor;
String result, busName, userName;
void setup () {

  reviewCount=new int[11];
  starImage=loadImage("star.gif");
  widgetColor = color(56, 90, 94);
  reviewTable=loadTable("reviews_cleaned.csv", "header");
  size(1680, 1050);
  // reviewTable = loadTable("reviews_cleaned.csv", "header");
  vs1 = new VScrollbar(SCREEN_X, 200, SCROLLWIDTH, SCROLLHEIGHT, 3*5+1);
  widgetFont = loadFont("SansSerif-14.vlw"); 
  textFont(widgetFont);
  widgetNext =new Widget(975, 125, 100, 40, 
    "Next", widgetColor, widgetFont, EVENT_BUTTON1);
  widgetPrev = new Widget(500, 125, 100, 40, "Previous", widgetColor, widgetFont, EVENT_BUTTON2);
  bizWidget = new Widget(700, 0, 100, 110, "Businesses", widgetColor, widgetFont, EVENT_BUTTON3);
  userWidget = new Widget(900, 0, 100, 110, "Users", widgetColor, widgetFont, EVENT_BUTTON4);
  reviewWidget = new Widget(500, 0, 100, 110, "Home", widgetColor, widgetFont, EVENT_BUTTON5);
  mostRecent = new Widget(1100, 0, 100, 110, "Recent", widgetColor, widgetFont, EVENT_BUTTON8);
  topRated = new Widget(1300, 0, 100, 110, "Top", widgetColor, widgetFont, EVENT_BUTTON9);
  Widget busWidget1 = new Widget(400, 200, 350, 40, "Carini's Homemade Ice Cream & Gelato", widgetColor, widgetFont, EVENT_BUTTON10);
  Widget busWidget2 = new Widget(400, 250, 350, 40, "Quicktrip No 453", widgetColor, widgetFont, EVENT_BUTTON11);
  Widget busWidget3 = new Widget(400, 300, 350, 40, "Barrio Fiesta - The Original", widgetColor, widgetFont, EVENT_BUTTON12);
  Widget busWidget4 = new Widget(400, 350, 350, 40, "Sally Beauty Supply", widgetColor, widgetFont, EVENT_BUTTON13);
  Widget busWidget5 = new Widget(400, 400, 350, 40, "Phoenix Pharmacy", widgetColor, widgetFont, EVENT_BUTTON14);
  Widget busWidget6 = new Widget(400, 450, 350, 40, "Impact Auto Glass & Tint", widgetColor, widgetFont, EVENT_BUTTON15);
  Widget busWidget7 = new Widget(400, 500, 350, 40, "Liberty", widgetColor, widgetFont, EVENT_BUTTON16);
  Widget busWidget8 = new Widget(400, 550, 350, 40, "Plantation Animal Clinic", widgetColor, widgetFont, EVENT_BUTTON17);
  Widget busWidget9 = new Widget(400, 600, 350, 40, "Super Star Car Wash", widgetColor, widgetFont, EVENT_BUTTON18);
  Widget busWidget10 = new Widget(950, 200, 350, 40, "Capriotti's Sandwich Shop", widgetColor, widgetFont, EVENT_BUTTON19);
  Widget busWidget11 = new Widget(950, 250, 350, 40, "Cool Springs Golf Center", widgetColor, widgetFont, EVENT_BUTTON20);
  Widget busWidget12 = new Widget(950, 300, 350, 40, "Peoria Nissan", widgetColor, widgetFont, EVENT_BUTTON21);
  Widget busWidget13 = new Widget(950, 350, 350, 40, "Cafe Presse", widgetColor, widgetFont, EVENT_BUTTON22);
  Widget busWidget14 = new Widget(950, 400, 350, 40, "Fresh & Easy", widgetColor, widgetFont, EVENT_BUTTON23);
  Widget busWidget15 = new Widget(950, 450, 350, 40, "Office Team", widgetColor, widgetFont, EVENT_BUTTON24);
  Widget busWidget16 = new Widget(950, 500, 350, 40, "Foreign Fix", widgetColor, widgetFont, EVENT_BUTTON25);
  Widget busWidget17 = new Widget(950, 550, 350, 40, "Dollarama", widgetColor, widgetFont, EVENT_BUTTON26);
  Widget busWidget18 = new Widget(950, 600, 350, 40, "McDonald's", widgetColor, widgetFont, EVENT_BUTTON27);
  Widget busWidget19 = new Widget(950, 650, 350, 40, "Realstar Management", widgetColor, widgetFont, EVENT_BUTTON28);
  businessNames = new ArrayList<String>(); 
  userNames = new ArrayList<String>();
  widgetList = new ArrayList<Widget>(); //Array list of widgets used in different screens.
  otherWij = new ArrayList<Widget>();
  bizWidgets = new ArrayList<Widget>();
  homeWij = new ArrayList<Widget>();
  userWijList = new ArrayList<Widget>();
  userEvents = new ArrayList<Integer>();

  otherWij.add(widgetNext);           //Add widgets to the correct widget lists
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

  reviewsArray = new ArrayList<Review>();            //Array list of reviews
  linePlotArray = new ArrayList<LinePlot>();
  barChartArray = new ArrayList<BarChart>();

  reviews = loadStrings("reviews_cleaned.csv");
  // userText = new userInput(400, 500, 600);
  backgroundTemplate = new background();
  //  searchBar = new userInput(1200, 30, 220);

  homeWij.add(widgetNext);
  homeWij.add(widgetPrev);
  homeWij.add(bizWij);
  homeWij.add(userWij);
  homeWij.add(topRated);
  homeWij.add(mostRecent);
  businessScreen = new Screen(bizWidgets, backgroundTemplate);

  currntscrn = homeScreen;                                  //set the home screen to the current screen
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
  Review[]mostRecent=findMostRecent();                                        //Call most recent
  recentScreen=new RecentScreen(widgetList, backgroundTemplate, mostRecent, reviewNumDisplayed);
  Review[]topRated=findTopRated();                                          //Call top rated
 
  for (int i = 1; i < reviewsArray.size(); i++) {
    Review testReview = (Review) reviewsArray.get(i);
    String name = testReview.getBusinessName();
    if (!businessNames.contains(name) ) {
      businessNames.add(name);                                            //get the list of business names
    }
  }
  for (int i = 1; i < reviewsArray.size(); i++) {
    Review testReview = (Review) reviewsArray.get(i);
    String name = testReview.getUserName();
    if (!userNames.contains(name)) {
      //println(name);
      userNames.add(name);                                                //get the list of user names 
    }
  }
  // username widgets event button arraylist 
  for (int i = 30; i < 105; i++) {
    userEvents.add(i);
  }
  println("there are " + userEvents.size() + " user event buttons"); //loop to make user widgets 
  for (int i = 0; i < userNames.size(); i++) {
    if (i < 10) {
      Widget wij = new Widget(70, 200 + (50*i), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >= 10 && i < 20) {
      Widget wij = new Widget(270, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >=20 && i < 30) {
      Widget wij = new Widget(480, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >=30 && i < 40) {
      Widget wij = new Widget(680, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >= 40 && i < 50) {
      Widget wij = new Widget(890, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >= 50 && i < 60) {
      Widget wij = new Widget(1090, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >=60 && i <70) {
      Widget wij = new Widget(1290, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    } else if (i >= 70 && i < 75) {
      Widget wij = new Widget(1510, 200 + (50*(i%10)), USERNAME_WIJ_WIDTH, USERNAME_WIJ_HEIGHT, userNames.get(i), widgetColor, widgetFont, userEvents.get(i));
      userWijList.add(wij);
    }
  }
  for (int i =0; i < businessNames.size(); i++) {
    int[] statistics=findReviews(businessNames.get(i));
    lineplot=new LinePlot(50, 60, 10, 100, 900, 700, 500, "Review Activity", "Years", "Reviews", 1, 11, 10, 4, statistics, businessNames.get(i));
    linePlotArray.add(lineplot);
  }

  //  println("There are " + userNames.size() + " names");
  if (reviewNumDisplayed < 0) {
    reviewNumDisplayed = 0;
  }
  searchBar = new userInput(1200, 30, 220, reviewsArray, businessNames, userNames);
  /*for (int i = 0; i < reviewsArray.size(); i++) {
   
   linePlotArray.add(lineplot);
   }*/
  Review nextReview = (Review) reviewsArray.get(reviewNumDisplayed);
  reviewScreen = new ReviewScreen (widgetList, backgroundTemplate, reviewsArray, reviewNumDisplayed, linePlotArray);
  userScreen = new Screen(userWijList, backgroundTemplate);
  homeScreen = new HomeScreen(homeWij, backgroundTemplate, userText);
  ratedScreen = new RecentScreen(widgetList, backgroundTemplate, topRated, reviewNumDisplayed);
  currScreen = reviewScreen;

 
}

void draw() {                          //draw the screens
  // float leftPos = vs1.getPos();
  //backgroundTemplate.draw();
  //println("Screen : " + screenInt);
  if (screenInt == 1 || screenInt == 8 || screenInt == 7) {
    currScreen.draw();
  } else if (screenInt == 2 || screenInt == 3) {
    currentScreen.draw();
  } else if (screenInt >= 30 && screenInt < 106) {
    cScreen.draw();
  } /* else if (screenInt == 4) {
   currntscreen.draw(); 
   }*/
  else if (screenInt==5) {
    cScreenRecent.draw();
  }
  else if(screenInt==6){
   cScreenTopRated.draw(); 
  }
 
  int event;
  /**/
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
        // println(reviewCount[0]);
        break;
      case 2008:
        reviewCount[1]++;
        // println(reviewCount[0]);
        break;
      case 2009:
        reviewCount[2]++;
        // println(reviewCount[0]);
        break;
      case 2010:
        reviewCount[3]++;
        //  println(reviewCount[0]);
        break;
      case 2011:
        reviewCount[4]++;
        // println(reviewCount[0]);
        break;
      case 2012:
        reviewCount[5]++;
        //  println(reviewCount[0]);
        break;
      case 2013:
        reviewCount[6]++;
        //   println(reviewCount[0]);
        break;
      case 2014:
        reviewCount[7]++;
        //  println(reviewCount[7]);
        break;
      case 2015:
        reviewCount[8]++;
        //  println(reviewCount[8]);
        break;
      case 2016:
        reviewCount[9]++;
        // println(reviewCount[9]);
        break;
      case 2017:
        reviewCount[10]++;
        //   println(reviewCount[10]);
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

void mousePressed() {        //Switch statement for when the mouse is pressed 
  int event;
  if (screenInt == 1|| screenInt == 7 || screenInt == 8 || screenInt == 2 || screenInt == 3 || screenInt == 5||screenInt==6) {
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
        screenInt=5;
        cScreenRecent=recentScreen;
        break;
      case EVENT_BUTTON9:
        println("Top Rated");
        screenInt=6;
        cScreenTopRated=ratedScreen;
        break;
      }
    }
  }
  if (screenInt == 2) {
    for (int i =0; i<bizWidgets.size(); i++) {
      Widget aWidget = (Widget) bizWidgets.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      if (reviewNumDisplayed  < 0) {
        reviewNumDisplayed = 0;
      }
      switch(event) {
      case EVENT_BUTTON10:
        println("One");
        screenInt = 1;
        filterByBusinessName("Carini's Homemade Ice Cream & Gelato");
        break;
      case EVENT_BUTTON11:
        println("Two");
        busName = "Quiktrip No 453";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON12:
        println("Three");
        busName = "Barrio Fiesta - The Original";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON13:
        println("Four");
        busName = "Sally Beauty Supply";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON14:
        println("Five");
        busName = "Phoenix Pharmacy";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON15:
        println("Six");
        busName = "Impact Auto Glass & Tint"; 
        screenInt = 1;
        filterByBusinessName(busName);
        break;
      case EVENT_BUTTON16:
        println("Seven");
        busName = "Liberty";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON17:
        println("Eight");
        busName = "Plantation Animal Clinic";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON18:
        println("Nine");
        busName = "Super Star Car Wash";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON19:
        println("Ten");
        busName = "Capriotti's Sandwich Shop";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON20:
        println("Eleven");
        busName = "Cool Springs Golf Centre";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON21:
        println("Twelve");
        busName = "Peoria Nissan";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON22:
        println("Thirteen");
        busName = "Cafe Presse";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON23:
        println("Fourteen");
        busName = "Fresh & Easy";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON24:
        println("Fifteen");
        busName = "OfficeTeam";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON25:
        println("Sixteen");
        busName = "Foreign Fix";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON26:
        println("Seventeen");
        busName = "Dollarama";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON27:
        println("Eighteen");
        busName = "McDonalds";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      case EVENT_BUTTON28:
        println("Nineteen");
        busName = "Realstar Management";
        filterByBusinessName(busName);
        screenInt = 1;
        break;
      }
    }
  }

  if (screenInt == 3) {
    for (int i = 5; i < userWijList.size(); i++) {
      Widget aWidget = (Widget) userWijList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      if (event != EVENT_NULL) {
        userName = aWidget.getLabel();
        filterByUserName(userName);
        //  println("Setting screenInt to " + event);
      }
    }
  }
}
void filterByBusinessName(String name) { //filter business names
  // screenInt = 1;
  screenInt = 7;
  busName = name;
  reviewNumDisplayed = 0;

  //ArrayList<Review> displayReviewsArray = reviewScreen.filterReviews(busName);
  businessProfile = new ReviewScreen(widgetList, backgroundTemplate, reviewsArray, reviewNumDisplayed, linePlotArray);
  businessProfile.setReviewNameFilter(busName);
  currScreen = businessProfile;
}
void filterByUserName(String name) {      //filter user names
  screenInt = 8;
  userName = name;
  reviewNumDisplayed = 0;

  //ArrayList<Review> displayReviewsArray = reviewScreen.filterReviews(busName);
  userProfile = new ReviewScreen(widgetList, backgroundTemplate, reviewsArray, reviewNumDisplayed, linePlotArray);
  userProfile.setReviewNameFilter(userName);
  currScreen = userProfile;
}
void keyPressed() {
  searchBar.userKeyPressed();
}
void userProfile() {
}
Review[] findMostRecent() {
  Review[]mostRecent=new Review[10];
  mostRecent[0]=review1;
  mostRecent[1]=review2;
  mostRecent[2]=review3;
  mostRecent[3]=review4;
  mostRecent[4]=review5;
  mostRecent[5]=review6;
  mostRecent[6]=review7;
  mostRecent[7]=review8;
  mostRecent[8]=review9;
  mostRecent[9]=review10;
  ArrayList<String>businessNames=new ArrayList<String>();
  ArrayList<String>userNames=new ArrayList<String>();
  Review currentReview;
  String currentBusiness;
  String currentReviewer;
  int topTen=0;
  boolean quit=true;
  boolean unique=true;
  boolean uhuh=false;
  String date="";
  for (int i=0; i<reviewsArray.size()&&topTen<10/*&&quit==false*/; i++) {
    if (topTen==11) {
      quit=true;
    }
    currentReview=reviewsArray.get(i);
    currentBusiness=currentReview.getBusinessName();
    if (!containsString(currentBusiness, businessNames)) {
      businessNames.add(currentBusiness);
    }
    currentReviewer=currentReview.getUserName();
    if (!containsString(currentReviewer, userNames)) {
      userNames.add(currentReviewer);
    }
    date=currentReview.getDate();
    for (int i2=0; i2<mostRecent.length&&unique==false; i2++) {
      uhuh=containsString(currentReviewer, userNames);
      println(uhuh);
      if (containsString(currentReviewer, userNames)) {
        unique=false;
      }
    }
    if (unique==true) {
      if (getYearFromDate(date)==2017) {
        mostRecent[topTen]=currentReview;
        topTen++;
      }
    }
  }
  return mostRecent;
}

boolean containsString(String name, ArrayList<String>names) {
  for (int i=0; i<names.size(); i++) {
    if (name.equals(names.get(i))) {
      return true;
    }
  }
  return false;
}
int[] findReviewsUsers(String userName) {//gets how many reviews the business got in each year, returns integer array.
  int[] reviewCount=new int[11];
  Review currentReview;
  String nameCompared;
  userName=getRidOfQuotation(userName);
  for (int i=0; i<reviewsArray.size(); i++) {
    currentReview=reviewsArray.get(i);
    nameCompared= getRidOfQuotation(currentReview.getUserName());
    if (userName.equals(nameCompared)) {
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
Review[]findTopRated() {
  Review[] topRated=new Review[10];
  int theTop10=0;
  boolean theSame=false;
  String currentBusiness=null;
  ArrayList<String>businessesChecked=new ArrayList<String>();
  Review currentReview;
  for (int i=0; i<reviewsArray.size()&&theTop10<=9; i++) {
    currentReview=reviewsArray.get(i);
    currentBusiness=currentReview.getBusinessName();
    theSame=containsString(currentBusiness, businessesChecked);
  
    double theAverage=findAverageStar(currentBusiness);//getting the average star rating of the business only if the business has not been checked before
    if (theAverage>=3.5&&!theSame) {
      businessesChecked.add(currentBusiness);
      topRated[theTop10]=currentReview;      //adds to top10 list
      
      theTop10++;
    }
  }
  return topRated;
}
double findAverageStar(String businessName) {      //finds the average star rating of a specific business for all its years(montly average)
  Review currentReview;
  String nameCompared;
  ArrayList<Integer>stars2007=new ArrayList<Integer>();
  ArrayList<Integer>stars2008=new ArrayList<Integer>();
  ArrayList<Integer>stars2009=new ArrayList<Integer>();
  ArrayList<Integer>stars2010=new ArrayList<Integer>();
  ArrayList<Integer>stars2011=new ArrayList<Integer>();
  ArrayList<Integer>stars2012=new ArrayList<Integer>();
  ArrayList<Integer>stars2013=new ArrayList<Integer>();
  ArrayList<Integer>stars2014=new ArrayList<Integer>();
  ArrayList<Integer>stars2015=new ArrayList<Integer>();
  ArrayList<Integer>stars2016=new ArrayList<Integer>();
  ArrayList<Integer>stars2017=new ArrayList<Integer>();
  businessName=getRidOfQuotation(businessName);
  for (int i=0; i<reviewsArray.size(); i++) {
    currentReview=reviewsArray.get(i);
    nameCompared= getRidOfQuotation(currentReview.getBusinessName());
    if (businessName.equals(nameCompared)) {
      String date=currentReview.getDate();
      int reviewsYear=getYearFromDate(date);
      int star=currentReview.getStars();
      switch(reviewsYear) {
      case 2007:
        stars2007.add(star);
        // println(stars2007);
        break;
      case 2008:
        stars2008.add(star);
        //println(stars2008);
        break;
      case 2009:
        stars2009.add(star);
        //println(stars2009);
        break;
      case 2010:
        stars2010.add(star);
        //println(stars2010);
        break;
      case 2011:
        stars2011.add(star);
        //println(stars2011);
        break;
      case 2012:
        stars2012.add(star);
        //println(stars2012);
        break;
      case 2013:
        stars2013.add(star);
        //println(stars2013);
        break;
      case 2014:
        stars2014.add(star);
        //println(stars2014);
        break;
      case 2015:
        stars2015.add(star);
        //println(stars2015);
        break;
      case 2016:
        stars2016.add(star);
        //println(stars2016);
        break;
      case 2017:
        stars2017.add(star);
        //println(stars2017);
        break;
      default:
        break;
      }
    }
  }
  double[]stats=new double[11];                //sending off array of star averages of each year
  double size=stars2007.size();
  size+=stars2008.size();
  size+=stars2009.size();
  size+=stars2010.size();
  size+=stars2011.size();
  size+=stars2012.size();
  size+=stars2013.size();
  size+=stars2014.size();
  size+=stars2015.size();
  size+=stars2016.size();
  size+=stars2017.size();
  println(size);
  int total= addArray(stars2007);
  total+=addArray(stars2008);
  total+=addArray(stars2009);
  total+=addArray(stars2010);
  total+=addArray(stars2011);
  total+=addArray(stars2012);
  total+=addArray(stars2013);
  total+=addArray(stars2014);
  total+=addArray(stars2015);
  total+=addArray(stars2016);
  total+=addArray(stars2017);
  double totald=(double)total;
  //println(totald);
  double sized=(double)size;
  //println(sized);
  double average=totald/sized;
  //println(average);
  return average;
}
double[]findAverageStarsUser(String userName) {      //finds the average star rating of a specific business for all its years
  Review currentReview;
  String nameCompared;
  ArrayList<Integer>stars2007=new ArrayList<Integer>();
  ArrayList<Integer>stars2008=new ArrayList<Integer>();
  ArrayList<Integer>stars2009=new ArrayList<Integer>();
  ArrayList<Integer>stars2010=new ArrayList<Integer>();
  ArrayList<Integer>stars2011=new ArrayList<Integer>();
  ArrayList<Integer>stars2012=new ArrayList<Integer>();
  ArrayList<Integer>stars2013=new ArrayList<Integer>();
  ArrayList<Integer>stars2014=new ArrayList<Integer>();
  ArrayList<Integer>stars2015=new ArrayList<Integer>();
  ArrayList<Integer>stars2016=new ArrayList<Integer>();
  ArrayList<Integer>stars2017=new ArrayList<Integer>();
  userName=getRidOfQuotation(userName);
  for (int i=0; i<reviewsArray.size(); i++) {
    currentReview=reviewsArray.get(i);
    nameCompared= getRidOfQuotation(currentReview.getUserName());
    if (userName.equals(nameCompared)) {
      String date=currentReview.getDate();
      int reviewsYear=getYearFromDate(date);
      int star=currentReview.getStars();
      switch(reviewsYear) {
      case 2007:
        stars2007.add(star);
        println(stars2007);
        break;
      case 2008:
        stars2008.add(star);
        println(stars2008);
        break;
      case 2009:
        stars2009.add(star);
        println(stars2009);
        break;
      case 2010:
        stars2010.add(star);
        println(stars2010);
        break;
      case 2011:
        stars2011.add(star);
        println(stars2011);
        break;
      case 2012:
        stars2012.add(star);
        println(stars2012);
        break;
      case 2013:
        stars2013.add(star);
        println(stars2013);
        break;
      case 2014:
        stars2014.add(star);
        println(stars2014);
        break;
      case 2015:
        stars2015.add(star);
        println(stars2015);
        break;
      case 2016:
        stars2016.add(star);
        //  println(stars2016);
        break;
      case 2017:
        stars2017.add(star);
        // println(stars2017);
        break;
      default:
        break;
      }
    }
  }
  double[]stats=new double[11];                //sending off array of star averages of each year
  
  stats[0]=calculateAverageStars(stars2007);
  stats[1]=calculateAverageStars(stars2008);
  stats[2]=calculateAverageStars(stars2009);
  stats[3]=calculateAverageStars(stars2010);
  stats[4]=calculateAverageStars(stars2011);
  stats[5]=calculateAverageStars(stars2012);
  stats[6]=calculateAverageStars(stars2013);
  stats[7]=calculateAverageStars(stars2014);
  stats[8]=calculateAverageStars(stars2015);
  stats[9]=calculateAverageStars(stars2016);
  stats[10]=calculateAverageStars(stars2017);


  return stats;
}
double[]findAverageStars(String businessName) {      //finds the average star rating of a specific business for all its years
  Review currentReview;
  String nameCompared;
  ArrayList<Integer>stars2007=new ArrayList<Integer>();
  ArrayList<Integer>stars2008=new ArrayList<Integer>();
  ArrayList<Integer>stars2009=new ArrayList<Integer>();
  ArrayList<Integer>stars2010=new ArrayList<Integer>();
  ArrayList<Integer>stars2011=new ArrayList<Integer>();
  ArrayList<Integer>stars2012=new ArrayList<Integer>();
  ArrayList<Integer>stars2013=new ArrayList<Integer>();
  ArrayList<Integer>stars2014=new ArrayList<Integer>();
  ArrayList<Integer>stars2015=new ArrayList<Integer>();
  ArrayList<Integer>stars2016=new ArrayList<Integer>();
  ArrayList<Integer>stars2017=new ArrayList<Integer>();
  businessName=getRidOfQuotation(businessName);
  for (int i=0; i<reviewsArray.size(); i++) {
    currentReview=reviewsArray.get(i);
    nameCompared= getRidOfQuotation(currentReview.getBusinessName());
    if (businessName.equals(nameCompared)) {
      String date=currentReview.getDate();
      int reviewsYear=getYearFromDate(date);
      int star=currentReview.getStars();
      switch(reviewsYear) {
      case 2007:
        stars2007.add(star);
        println(stars2007);
        break;
      case 2008:
        stars2008.add(star);
        println(stars2008);
        break;
      case 2009:
        stars2009.add(star);
        println(stars2009);
        break;
      case 2010:
        stars2010.add(star);
        println(stars2010);
        break;
      case 2011:
        stars2011.add(star);
        println(stars2011);
        break;
      case 2012:
        stars2012.add(star);
        println(stars2012);
        break;
      case 2013:
        stars2013.add(star);
        println(stars2013);
        break;
      case 2014:
        stars2014.add(star);
        println(stars2014);
        break;
      case 2015:
        stars2015.add(star);
        println(stars2015);
        break;
      case 2016:
        stars2016.add(star);
        //  println(stars2016);
        break;
      case 2017:
        stars2017.add(star);
        // println(stars2017);
        break;
      default:
        break;
      }
    }
  }
  double[]stats=new double[11];                //sending off array of star averages of each year

  stats[0]=calculateAverageStars(stars2007);
  stats[1]=calculateAverageStars(stars2008);
  stats[2]=calculateAverageStars(stars2009);
  stats[3]=calculateAverageStars(stars2010);
  stats[4]=calculateAverageStars(stars2011);
  stats[5]=calculateAverageStars(stars2012);
  stats[6]=calculateAverageStars(stars2013);
  stats[7]=calculateAverageStars(stars2014);
  stats[8]=calculateAverageStars(stars2015);
  stats[9]=calculateAverageStars(stars2016);
  stats[10]=calculateAverageStars(stars2017);


  return stats;
}
double calculateAverageStars(ArrayList<Integer> starArray) {    //gets the average star rating of a specific business for one year
  int total=0;
  if (starArray.size()>0) {
    for (int i=0; i<starArray.size(); i++) {
      total+=starArray.get(i);
    }
    int arrayLength=starArray.size();
    double average=total/arrayLength;
    return average;
  } else {
    //System.out.println("i be broke");
    return total;
  }
}
int addArray(ArrayList<Integer>arrayList) {
  int total=0;
  for (int i=0; i<arrayList.size(); i++) {
    total+=arrayList.get(i);
  }
  return total;
}