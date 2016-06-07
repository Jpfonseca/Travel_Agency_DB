Imports System.Data.SqlClient
Public Class Form3
    Protected Const SqlConnectionString As String =
                                             "Server=AsusNB\SQLEXPRESS;" &
                                             "DataBase=Sistema;" &
                                             "Integrated Security=SSPI"
    Dim CN As SqlConnection
    Dim PostoVenda As Integer = 1

    Dim WithEvents f1 As Form1


    Private Sub ConnectToDB()
        CN = New SqlConnection(SqlConnectionString)
        Try
            CN.Open()
            If CN.State = ConnectionState.Open Then
                MsgBox("Successful connection to database " + CN.Database + " on the " +
                        CN.DataSource + " server", MsgBoxStyle.OkOnly, "Connection")
                Run()
            End If
        Catch ex As Exception
            MsgBox("Failed to open connection to DB:" + vbCrLf + ex.Message, MsgBoxStyle.Critical, "Connection")

        End Try

    End Sub



    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ConnectToDB()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Close()
    End Sub
    Private Sub Run()
        Me.Hide()

        ''CN.Close()
        f1 = New Form1(CN, PostoVenda)
        f1.Show()





    End Sub

    Private Sub Form1_FormClosing(sender As Object, e As FormClosingEventArgs) Handles f1.FormClosing

        Me.Close()
    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged

    End Sub
End Class