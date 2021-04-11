# Hangman
An iOS app which is based on Hangman game.

**Hangman game:**

User has to find the missing words presented as blanks. The words are from the themes such as Famous People, Countries, Movies, TV shows, Dictionary and by Mixing all themes. User has 7 tries to find a word if not it is a HANGMAN :P.

Motivation: To replicate this Webapp into iOS app - https://thewordsearch.com/hangman/

***************************************

# How To Run the app:

## Backend:

This will start the Themes server at specified localhost and gets request from ios frontend client app and returns a json of key value pairs such as wordOfTheDay and clue.

FYI: Backend uses Vapor framework, so if you don't have vapor please install by following instructions from here: https://docs.vapor.codes/4.0/install/macos/

After installing vapor or if you have vapor already, follow the instructions below to setup:

1. Goto The Theme server directory - `cd Backend/ThemesServer`
2. Open the Theme sever project using xcode - `vapor xcode`
3. After the xcode project opens successfully, first build the project by doing `CMD+B` and run the project using `CMD+R`. 
4. When it runs successfuly, it should start the localhost server at the specified port on the console.
5. Once the server is successfully running, you can test by typing this endpoint on the browser for example:- `http://127.0.0.1:8080/themes/0` and this should return JSON

**IMPORTANT NOTE:** *If you want to try setting up the above server in a real device, then Goto your target in the vapor > Edit Scheme > Run > In the Arguments passed on launch > Type the following like in the in the screenshot below.*

**MAKE SURE YOUR IPHONE WIFI IS CONNECTED TO SAME AS YOUR MAC'S WIFI, SO THAT IP ADDRESS SUPPLIED WILL BE THE SAME.** 
```
serve --hostname YOUR_IP_ADDRESS --port 8080
```
<img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/ThemesServer-Info.png" width="1000" height="800"> 


## Frontend:
This is the iOS client app which utilizes above started backend vapo server to get data and supply it for the Hangman game, namely clue and word of the day.

1. Make sure you start backend server, if you haven't done already - please follow above **Backend** part for instructions
2. Open Frontend ios client app project in xcode - `open Frontend/Hangman/Hangman.xcodeproj` (This will open in xcode if you have it installed)
3. After the xcode project opens successfully, first build the project by doing `CMD+B` and run the project using `CMD+R`. 
4. Depending upon what device you connect (physical or simulator), it should open in that and start the Hangman game. 

***************************************

## Lights, Camera, Action
<img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Gifs/Game.gif" width="250" height="500">

***************************************

## Screenshots
<div>
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/e1.png" width="250" height="500">
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/e2.png" width="250" height="500">
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/e3.png" width="250" height="500">
</div>
<div>
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/e4.png" width="250" height="500">
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/e5.png" width="250" height="500">
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/e6.png" width="250" height="500">
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/e7.png" width="250" height="500">
</div>

***************************************

## Localization - Spanish
<div>
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/s.png" width="250" height="500">
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/s1.png" width="250" height="500">
    <img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Screenshots/s2.png" width="250" height="500">
</div>

***************************************

## Light To Dark Mode Transition
<img src="https://github.com/AkshayRameshAppDEV/Hangman/blob/main/Gifs/LightToDarkMode.gif" width="250" height="500">
