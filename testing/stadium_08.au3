#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16
 Author:         Ernst Bekkering

 Script Function:
	read tests from file for real
#ce ----------------------------------------------------------------------------
#include <File.au3> ;need library for file reading
#include <Array.au3> ; ordinary arrays included in regular library; this one is for FileReadToArray

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

$sFilePath = "tests.csv" ; csv file in same directory
Local $aTestsArray ; define the array. I made this local; it still works
; path to file, name to give array, dimensions, delimiter. Just highlight and use F1 to check syntax
_FileReadToArray($sFilePath,$aTestsArray, 2, ",")

$iTests = 0 ; number of tests was 4, now we will count the tests in the loop

;delete the old two dimensional tests array. commented out for now, delete later
;~ Global $aTest[$iTests][9] = [[2,4,6,"$30.00","$48.00","$54.00","$132.00","","EP1"], _
;~ 					[2,4,6,"$30.00","$48.00","$54.00","$133.00","","error1"], _
;~ 					[1,2,3,"$15.00","$24.00","$27.00","$66.00","","EP2"], _
;~ 					[1,2,3,"$15.00","$24.00","$27.00","$67.00","","error2"]]

$iPassed = 0
$iFailed = 0

ControlClick($stadium, "", $buttonClear)

;For $x = 0 To $iTests -1 ;replace with next line
For $row in $aTestsArray  ; $x = 0 To $iTests -1
	ControlSetText($stadium, "", $inputA,$row[0])  ; replace $aTest[$x][0] with item in row
	ControlSetText($stadium, "", $inputB, $row[1])
	ControlSetText($stadium, "", $inputC, $row[2])
	ControlClick($stadium, "", $buttonCalculate)

	$chargesA = ControlGetText($stadium,"",$labelA)
	$chargesB = ControlGetText($stadium,"",$labelB)
	$chargesC = ControlGetText($stadium,"",$labelC)
	$chargesTotal = ControlGetText($stadium,"",$labelTotal)
	$message = ControlGetText($stadium,"",$labelMessage)

	$iTests +=1 ; add to the tests

	;replace $x with test name in $row[8]
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