#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16
 Author:         Ernst Bekkering

 Script Function:
	make it even better - add headers to the csv file (and excel spreadsheet) for easy test generation
#ce ----------------------------------------------------------------------------
#include <File.au3>
#include <Array.au3>

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

$sFilePath = "tests_with_headers.csv"
Local $aTestsArray

If _FileReadToArray($sFilePath,$aTestsArray, 2, ",") Then

	$iTests = 0
	$iPassed = 0
	$iFailed = 0

	ControlClick($stadium, "", $buttonClear)

	For $row in $aTestsArray

		If $row[8] == "TestName" Then ; this is how we skip the header
		   ContinueLoop
	    EndIf

		ControlSetText($stadium, "", $inputA,$row[0])
		ControlSetText($stadium, "", $inputB, $row[1])
		ControlSetText($stadium, "", $inputC, $row[2])
		ControlClick($stadium, "", $buttonCalculate)

		$chargesA = ControlGetText($stadium,"",$labelA)
		$chargesB = ControlGetText($stadium,"",$labelB)
		$chargesC = ControlGetText($stadium,"",$labelC)
		$chargesTotal = ControlGetText($stadium,"",$labelTotal)
		$message = ControlGetText($stadium,"",$labelMessage)

		$iTests +=1

		If $chargesTotal == $row[6] Then
			ConsoleWrite("test " & $row[8] & " passed" & @CRLF)
			$iPassed +=1
		Else
			ConsoleWrite("test " & $row[8] & " failed: expected " & $row[6] & ", actual " & $chargesTotal & @CRLF)
			$iFailed += 1
		EndIf
	Next

	ConsoleWrite(@crlf & "Summary" & @CRLF & "--------" & @CRLF)
	Consolewrite($iPassed & " out of " & $iTests & " tests passed; " & $iFailed & " failed." & @CRLF & @CRLF)

Else
	ConsoleWrite("There was an error reading the file. ")
EndIf