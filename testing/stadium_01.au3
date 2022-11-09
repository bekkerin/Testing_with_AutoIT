#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16
 Author:         Ernst Bekkering

 Script Function:
	start with basic functionality of enterig data, clicking on the
	calculate button, reading the output, and displaying in console at
	the bottom
	YOU HAVE TO HAVE THE APPLICATION RUNNING TO MAKE THE SCRIPT WORK
#ce ----------------------------------------------------------------------------
$stadium = "Stadium Seating" ; so we dont' have to type $stadium all the time
WinActivate($stadium) ; Activates (gives focus to) a window.
$adder = WinWaitActive($stadium) ;Pauses execution of the script until the requested window is active.
AutoItSetOption("SendKeyDelay", 400) ; try highlighting AutoItSetOption and clicking F1

;name all controls
$inputA = "[Name:txtClassA]"
$inputB = "[Name:txtClassB]"
$inputC = "[Name:txtClassC]"
$labelA = "[Name:lblClassArevenue]"
$labelB = "[Name:lblClassBrevenue]"
$labelC = "[Name:lblClassCrevenue]"
$labelTotal = "[Name:lblTotalRevenue]"
$labelMessage = "[Name:lblMessage]"
$buttonCalculate = "[Name:btnCalculate]"
$buttonClear = "[Name:btnClear]"
$buttonExit = "[Name:btnExit]"

; later we will use loops so let's clear all controls first
ControlClick($stadium, "", $buttonClear) ; try highlighting ControlClick and clicking F1

; input numbers to the text boxes
ControlSetText($stadium, "", $inputA,"1") ;try highlighting ControlSetText and clicking F1
ControlSetText($stadium, "", $inputB, "2")
ControlSetText($stadium, "", $inputC, "3")
ControlClick($stadium, "", $buttonCalculate)

; get the value from the labels
$chargesA = ControlGetText($stadium,"",$labelA) ; try highlighting ControlGetText and clicking F1
$chargesB = ControlGetText($stadium,"",$labelB)
$chargesC = ControlGetText($stadium,"",$labelC)
$chargesTotal = ControlGetText($stadium,"",$labelTotal)
$message = ControlGetText($stadium,"",$labelMessage)

;show results in console. For simplicity, we only print the values on separate lines so we are sure we can read them
ConsoleWrite($chargesA & @CRLF) ; @CRLF is constant for Enter key
ConsoleWrite($chargesB & @CRLF)
ConsoleWrite($chargesC & @CRLF)
ConsoleWrite($chargesTotal & @CRLF)
