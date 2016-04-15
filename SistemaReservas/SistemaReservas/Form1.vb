Imports System.Data.SqlClient
Public Class Form1
    Dim CN As SqlConnection

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub TestDBConnection(ByVal dbServer As String, ByVal dbName As String,
                                    ByVal userName As String, ByVal userPass As String)

        CN = New SqlConnection("Data Source = " + dbServer + " ;" + "Initial Catalog = " + dbName +
                                "; uid = " + userName + ";" + "password = " + userPass)

        Try
            CN.Open()
            If CN.State = ConnectionState.Open Then
                MsgBox("Successful connection to database " + CN.Database + " on the " +
                        CN.DataSource + " server", MsgBoxStyle.OkOnly, "Connection Test")
            End If

        Catch ex As Exception
            MsgBox("FAILED TO OPEN CONNECTION TO DATABASE DUE TO THE FOLLOWING ERROR" +
                    vbCrLf + ex.Message, MsgBoxStyle.Critical, "Connection Test")
        End Try

        If CN.State = ConnectionState.Open Then CN.Close()
    End Sub

    Private Sub Label1_Click(sender As Object, e As EventArgs) Handles Label1.Click

    End Sub

    Private Sub Label3_Click(sender As Object, e As EventArgs) Handles Label3.Click

    End Sub

    Private Sub Label5_Click(sender As Object, e As EventArgs) Handles Label5.Click

    End Sub
End Class
