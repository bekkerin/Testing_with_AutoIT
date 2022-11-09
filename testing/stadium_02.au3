#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16
 Author:         Ernst Bekkering

 Script Function:
	start using a one dimensional array for input
#ce ----------------------------------------------------------------------------
$stadium = "Stadium Seating"
WinActivate($stadium)
$adder = WinWaitActive($stadium)
AutoItSetOption("SendKeyDelay", 400)

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

; declare the array
Global $aTest[8] = [1,2,3,"$15.00:,$24.00","$27.00","$66.00",""] ; highlight Global and click F1 to read about Global, Local, and Dim

; clear all controls
ControlClick($stadium, "", $buttonClear)

; input numbers to the text boxes
ControlSetText($stadium, "", $inputA,$aTest[0]) ;replace "1" with $aTest[0]
ControlSetText($stadium, "", $inputB, $aTest[1])
ControlSetText($stadium, "", $inputC, $aTest[2])
ControlClick($stadium, "", $buttonCalculate)

; get the value from the labels
$chargesA = ControlGetText($stadium,"",$labelA) ; try highlighting ControlGetText and clicking F1
$chargesB = ControlGetText($stadium,"",$labelB)
$chargesC = ControlGetText($stadium,"",$labelC)
$chargesTotal = ControlGetText($stadium,"",$labelTotal)
$message = ControlGetText($stadium,"",$labelMessage)

;show results in console.
ConsoleWrite($chargesA & @CRLF)
ConsoleWrite($chargesB & @CRLF)
ConsoleWrite($chargesC & @CRLF)
ConsoleWrite($chargesTotal & @CRLF)
