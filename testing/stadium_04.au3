#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16
 Author:         Ernst Bekkering

 Script Function:
	start using a two dimensional array and loop the tests
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
Global $aTest[2][8] = [[2,4,6,"30.00","48.00","54.00","132.00",""], _  ; line continuation is comma space underscore
					[1,2,3,"15.00","24.00","27.00","66.00",""]]

; clear all controls
ControlClick($stadium, "", $buttonClear)

;build the entering of data, reading the output, and checking the result into loops
For $x = 0 to 1  ; we have two tests
	ControlSetText($stadium, "", $inputA,$aTest[$x][0]) ; add the second index
	ControlSetText($stadium, "", $inputB, $aTest[$x][1])
	ControlSetText($stadium, "", $inputC, $aTest[$x][2])
	ControlClick($stadium, "", $buttonCalculate)

	$chargesA = ControlGetText($stadium,"",$labelA)
	$chargesB = ControlGetText($stadium,"",$labelB)
	$chargesC = ControlGetText($stadium,"",$labelC)
	$chargesTotal = ControlGetText($stadium,"",$labelTotal)
	$message = ControlGetText($stadium,"",$labelMessage)

	If $chargesTotal == $aTest[$x][6] Then
		ConsoleWrite("test " & $x & " passed" & @CRLF) ; x is easier than x+1
	Else
		ConsoleWrite("test " & $x & " failed" & @CRLF)
	EndIf
Next ; for loops always end with Next