# Testing_with_AutoIT
 Demo project of using black box testing with Python and Pyautogui

## Description of the project
The project shows a simple application in Visual C# and how to test it with Python and Pyautogui. Pyautogui allows the user to use mouse and keyboard functions to automatically advance through a  program.

## Installation
### Pyautogui
After installing Python 3, add Pyautogui with the command pip install pyautogui.
### Visual Studio
The program to be tested is written in Visual C# and Visual Studio is the easiest language to edit and test it. On the [download page](https://visualstudio.microsoft.com/downloads/), select the Community Edition (free) and make sure that you install Visual C#. 

## Test application
The application is Stadium Seating, a slight modification from an exercise in the Visual C# textbook xxxxxx. The controls have been renamed with Hungarian notation (txtClassA for the number of Class A tickets for instance). For testing purposed, the text boxes for the outcome of the calculations, which are normally set to ReadOnly and TabStop false, have been set to TabStop True so they can be tested. The Tab sequence has been set to classA, classB, ClassC, Calculate, revenueA, revenueB, revenueC, totalRevenu, Clear, and Exit. Upon Clear, the focus shifts automatically back to classA. 
