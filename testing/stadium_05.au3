#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16
 Author:         Ernst Bekkering

 Script Function:
	improve the test message - explain why tests fail
#ce ----------------------------------------------------------------------------
$stadium = "Stadium Seating"
WinActivate($stadium)
$adder = WinWaitActive($stadium)
AutoItSetOption("SendKeyDelay", 400)

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
Global $aTest[2][8] = [[2,4,6,"30.00","48.00","54.00","132.00",""], _
					[1,2,3,"15.00","24.00","27.00","66.00",""]]

ControlClick($stadium, "", $buttonClear)

;build the entering of data, reading the output, and checking the result into loops
For $x = 0 to 1  ; we have two tests
	ControlSetText($stadium, "", $inputA,$aTest[$x][0])
	ControlSetText($stadium, "", $inputB, $aTest[$x][1])
	ControlSetText($stadium, "", $inputC, $aTest[$x][2])
	ControlClick($stadium, "", $buttonCalculate)

	$chargesA = ControlGetText($stadium,"",$labelA)
	$chargesB = ControlGetText($stadium,"",$labelB)
	$chargesC = ControlGetText($stadium,"",$labelC)
	$chargesTotal = ControlGetText($stadium,"",$labelTotal)
	$message = ControlGetText($stadium,"",$labelMessage)

	; highlight = and use F1 to check syntax. Single = is for number comparison; double == is for string comparison.
	If $chargesTotal == $aTest[$x][6] Then
		ConsoleWrite("test " & $x & " passed" & @CRLF)
	Else
		ConsoleWrite("test " & $x & " failed: expected " & $aTest[$x][6] & ", actual " & $chargesTotal & @CRLF)
	EndIf
Next