
Imports System.Data.SqlClient
Public Class Form1
    Protected Const SqlConnectionString As String =
                                             "Server=AsusNB\SQLEXPRESS;" &
                                             "DataBase=Sistema;" &
                                             "Integrated Security=SSPI"
    Dim CN As SqlConnection
    Dim postovenda As Integer
    Dim WithEvents f2 As Configurar

    Public Sub New(ByRef sq As SqlConnection, pv As Integer)
        CN = sq
        postovenda = pv
        InitializeComponent()
        Me.Panel3.Visible = False
        Me.Panel4.Visible = False
        Me.Panel3.Visible = True
        ' transportes
        Dim command As SqlCommand = New SqlCommand("select distinct Designacao from udf_getTiposdeTransporte()", CN)
        Dim reader As SqlDataReader = command.ExecuteReader()
        While reader.Read()
            ComboBox5.Items.Add(reader(0))
        End While
        command.Dispose()
        reader.Close()
        'CN.Close()

        ' 
    End Sub

    Private Sub Label1_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub Label3_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub Label5_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ' adicionar reserva
        ' hide panel2 e mostrar panel de adicionar reserva
        panelSwitch(Me.Panel1, Me.Panel3)

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        ' gerir reservas
        panelSwitch(Me.Panel1, Me.Panel4)


    End Sub

    Private Sub Panel2_Paint(sender As Object, e As PaintEventArgs)

    End Sub

    Private Sub panelSwitch(p1 As Panel, p2 As Panel)
        p1.Visible = False
        p2.Visible = True
    End Sub

    Private Sub Panel3_Paint(sender As Object, e As PaintEventArgs) Handles Panel3.Paint

    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        panelSwitch(Panel3, Panel1)
    End Sub

    Private Sub Label5_Click_1(sender As Object, e As EventArgs) Handles Label5.Click

    End Sub

    Private Sub ComboBox5_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox5.SelectedIndexChanged
        'atualizar partidas
        Dim command As SqlCommand = New SqlCommand("select * from udf_getLocalPartida(@Hora , @Designacao)", CN)
        ' command.CommandText = ("select * from udf_getLocalPartida(@Hora , @Designacao)")
        'command.CommandType = command.CommandText
        ComboBox1.SelectedItem = -1
        ComboBox2.SelectedItem = -1

        command.Parameters.Add("@Hora", SqlDbType.Date).Value = DateTimePicker1.Value.Date
        command.Parameters.Add("@Designacao", SqlDbType.VarChar).Value = ComboBox5.SelectedItem
        command.Connection = CN
        Dim reader As SqlDataReader = command.ExecuteReader()
        ComboBox1.Items.Clear()
        While reader.Read()
            ComboBox1.Items.Add(reader(0))
        End While
        command.Dispose()
        reader.Close()

        'command.CommandType = CommandType.StoredProcedure
        'command.Parameters.Add("@LocalPartida", SqlDbType.VarChar).Value = ComboBox5.SelectedItem
        'command.Parameters.Add("@Hora", SqlDbType.Date).Value = DateTimePicker1.Value
        'command.ExecuteNonQuery()
        'command.Dispose()

    End Sub

    Private Sub Panel1_Paint(sender As Object, e As PaintEventArgs) Handles Panel1.Paint

    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub

    Private Sub Panel4_Paint(sender As Object, e As PaintEventArgs) Handles Panel4.Paint

    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        panelSwitch(Panel4, Panel1)
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        f2 = New Configurar(CN)
        f2.Show()
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged

        ComboBox2.SelectedItem = -1

        Dim command As SqlCommand = New SqlCommand("select * from udf_getLocalDestino(@LocalPartida , @Hora , @Designacao)", CN)
        command.Parameters.Add("@LocalPartida", SqlDbType.VarChar).Value = ComboBox1.SelectedItem
        command.Parameters.Add("@Hora", SqlDbType.Date).Value = DateTimePicker1.Value.Date
        command.Parameters.Add("@Designacao", SqlDbType.VarChar).Value = ComboBox5.SelectedItem

        command.Connection = CN
        Dim reader As SqlDataReader = command.ExecuteReader()
        ComboBox2.Items.Clear()
        While reader.Read()
            ComboBox2.Items.Add(reader(0))
        End While
        command.Dispose()
        reader.Close()
    End Sub

    Private Sub ComboBox2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox2.SelectedIndexChanged

    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        'criar reserva

    End Sub
End Class

