Imports System.Data.SqlClient
Public Class Configurar
    'Protected Const SqlConnectionString As String =
    '                                        "Server=AsusNB\SQLEXPRESS;" &
    '                                        "DataBase=Sistema;" &
    '                                       "Integrated Security=SSPI"
    Dim CN As SqlConnection
    Public Sub New(ByRef sq As SqlConnection)

        InitializeComponent()
        Me.CN = sq
        Dim command As SqlCommand = New SqlCommand("select * from udf_getPostosdeVenda()", CN)
        Dim reader As SqlDataReader = command.ExecuteReader()
        While reader.Read()
            ListBox1.Items.Add(reader(0))
        End While
        reader.Close()
        command.Dispose()
        ' 
    End Sub
    Private Sub Configurar_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub ListBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ListBox1.SelectedIndexChanged

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'atualizar
        ListBox1.Items.Clear()
        Dim command As SqlCommand = New SqlCommand("select * from udf_getPostosdeVenda()", CN)
        Dim reader As SqlDataReader = command.ExecuteReader()
        While reader.Read()
            ListBox1.Items.Add(reader(0))
        End While
        reader.Close()
        command.Dispose()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'novo posto
        Dim command As SqlCommand = New SqlCommand("sp_insertPosto_Venda")
        command.Connection = CN
        command.CommandType = CommandType.StoredProcedure
        command.ExecuteNonQuery()

    End Sub

    Private Sub Label1_Click(sender As Object, e As EventArgs) Handles Label1.Click

    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim command As SqlCommand = New SqlCommand("sp_insertPessoaCliente")
        command.Connection = CN
        command.CommandType = CommandType.StoredProcedure

        command.Parameters.Add("@CC", SqlDbType.Int).Value = TextBox2.Text
        command.Parameters.Add("@Nif", SqlDbType.Int).Value = TextBox3.Text
        command.Parameters.Add("@nome", SqlDbType.VarChar).Value = TextBox1.Text
        command.Parameters.Add("@Contacto", SqlDbType.Int).Value = TextBox4.Text
        Try
            command.ExecuteNonQuery()
            MsgBox("Cliente Adicionado.", MsgBoxStyle.OkOnly, "Informação")
        Catch ex As Exception
            MsgBox("Cliente já existe.", MsgBoxStyle.Critical, "Erro")
        End Try
        command.Dispose()
        TextBox1.Clear()
        TextBox2.Clear()
        TextBox3.Clear()
        TextBox4.Clear()
    End Sub
End Class