#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16
 Author:         Ernst Bekkering

 Script Function:
	try out some of the error messages. increase tests to 4
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

$iTests = 4 ; change tests to 4
Global $aTest[$iTests][9] = [[2,4,6,"30.00","48.00","54.00","132.00","","EP1"], _
					[2,4,6,"30.00","48.00","54.00","133.00","","error1"], _
					[1,2,3,"15.00","24.00","27.00","66.00","","EP2"], _
					[1,2,3,"15.00","24.00","27.00","67.00","","error2"]]
$iPassed = 0
$iFailed = 0

ControlClick($stadium, "", $buttonClear)

For $x = 0 To $iTests -1 ; index starts at 0
	ControlSetText($stadium, "", $inputA,$aTest[$x][0])
	ControlSetText($stadium, "", $inputB, $aTest[$x][1])
	ControlSetText($stadium, "", $inputC, $aTest[$x][2])
	ControlClick($stadium, "", $buttonCalculate)

	$chargesA = ControlGetText($stadium,"",$labelA)
	$chargesB = ControlGetText($stadium,"",$labelB)
	$chargesC = ControlGetText($stadium,"",$labelC)
	$chargesTotal = ControlGetText($stadium,"",$labelTotal)
	$message = ControlGetText($stadium,"",$labelMessage)

	If $chargesTotal == $aTest[$x][6] Then
		ConsoleWrite("test " & $x & " passed" & @CRLF)
		$iPassed +=1
	Else
		ConsoleWrite("test " & $x & " failed: expected " & $aTest[$x][6] & ", actual " & $chargesTotal & @CRLF)
		$iFailed += 1
	EndIf
Next

ConsoleWrite(@crlf & "Summary" & @CRLF & "--------" & @CRLF)
Consolewrite($iPassed & " out of " & $iTests & " tests passed; " & $iFailed & " failed." & @CRLF & @CRLF)