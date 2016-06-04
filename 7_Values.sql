USE Sistema;

--Pessoa Values(CC,Nome
				--Funcionarios
EXECUTE sp_insertPessoa 1234,'Antonio Alves';
EXECUTE sp_insertPessoa 1235,'Alvaro Antunes';
EXECUTE sp_insertPessoa 12324,'Barbara Alves';
EXECUTE sp_insertPessoa 12357,'Bernardo Costa';
EXECUTE sp_insertPessoa 121788,'Joao Cena';
EXECUTE sp_insertPessoa 2525525,'Sergio Pires';
EXECUTE sp_insertPessoa 25258888,'Rui Espinja';
EXECUTE sp_insertPessoa 55884,'Andre Conciente';
EXECUTE sp_insertPessoa 448458,'Renato Seabra';
EXECUTE sp_insertPessoa 1458,'Carlos Cruz';
EXECUTE sp_insertPessoa 51515,'Isaltino Morais';
EXECUTE sp_insertPessoa 515158,'Catalina Pestana';
EXECUTE sp_insertPessoa 5486848,'Anibal Asdrubal';
EXECUTE sp_insertPessoa 89585247,'Rosa Aveiro';
				--Clientes
EXECUTE sp_insertPessoa 12346,'Joao Alves';
EXECUTE sp_insertPessoa 12356,'Vitor Antunes';
EXECUTE sp_insertPessoa 123246,'Manuel Alves';
EXECUTE sp_insertPessoa 123576,'Ricardo Costa';
EXECUTE sp_insertPessoa 1217886,'Joao Sena';
EXECUTE sp_insertPessoa 25255256,'Mario Pires';
EXECUTE sp_insertPessoa 252588886,'Rui Esponja';
EXECUTE sp_insertPessoa 558846,'Andre InConciente';
EXECUTE sp_insertPessoa 4484586,'Carlos Castro';
EXECUTE sp_insertPessoa 14586,'Cristiano Silvestre';
EXECUTE sp_insertPessoa 515156,'Ines Morais';
EXECUTE sp_insertPessoa 5151586,'Isabel Pestana';
EXECUTE sp_insertPessoa 54868486,'Luis Asdrubal';
EXECUTE sp_insertPessoa 895852476,'Sara Aveiro';

--Funcionario(nfuncionario,cc_funcionario 32767
EXECUTE sp_insertFuncionario 1234;
EXECUTE sp_insertFuncionario 1235;
EXECUTE sp_insertFuncionario 12324;
EXECUTE sp_insertFuncionario 12357;
EXECUTE sp_insertFuncionario 121788;
EXECUTE sp_insertFuncionario 2525525;
EXECUTE sp_insertFuncionario 25258888;
EXECUTE sp_insertFuncionario 55884;
EXECUTE sp_insertFuncionario 448458;
EXECUTE sp_insertFuncionario 1458;
EXECUTE sp_insertFuncionario 51515;
EXECUTE sp_insertFuncionario 515158;
EXECUTE sp_insertFuncionario 5486848;
EXECUTE sp_insertFuncionario 89585247;

--Posto_Venda(N_Balcao

EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;
EXECUTE sp_insertPosto_Venda ;

--Cliente(Nif,Contacto_telefonico
EXECUTE sp_insertCliente 222154988,961846516;
EXECUTE sp_insertCliente 555849985,965866848;
EXECUTE sp_insertCliente 848961861,935684618;
EXECUTE sp_insertCliente 686845168,931168462;
EXECUTE sp_insertCliente 616841451,923516846;
EXECUTE sp_insertCliente 265223669,935168468;
EXECUTE sp_insertCliente 268484294,913544582;
EXECUTE sp_insertCliente 234816984,946846846;
EXECUTE sp_insertCliente 284138465,986184646;
EXECUTE sp_insertCliente 235138468,941681651;
EXECUTE sp_insertCliente 238413845,914943548;
EXECUTE sp_insertCliente 235186488,986846545;
EXECUTE sp_insertCliente 235484868,918486848;
EXECUTE sp_insertCliente 215536849,935468884;

EXECUTE sp_insertCliente 221154988,961846516;
EXECUTE sp_insertCliente 551849985,965866848;
EXECUTE sp_insertCliente 841961861,935684618;
EXECUTE sp_insertCliente 681845168,931168462;
EXECUTE sp_insertCliente 611841451,923516846;
EXECUTE sp_insertCliente 261223669,935168468;
EXECUTE sp_insertCliente 261484294,913544582;
EXECUTE sp_insertCliente 231816984,946846846;
EXECUTE sp_insertCliente 281138465,986184646;
EXECUTE sp_insertCliente 231138468,941681651;
EXECUTE sp_insertCliente 231413845,914943548;
EXECUTE sp_insertCliente 231186488,986846545;
EXECUTE sp_insertCliente 231484868,918486848;
EXECUTE sp_insertCliente 211536849,935468884;

--Trabalha(N_Balcao_fk,Num_Funcionario_fk

EXECUTE sp_insertTrabalha 1,1;
EXECUTE sp_insertTrabalha 2,2;
EXECUTE sp_insertTrabalha 3,3;
EXECUTE sp_insertTrabalha 4,4;
EXECUTE sp_insertTrabalha 5,5;
EXECUTE sp_insertTrabalha 6,6;
EXECUTE sp_insertTrabalha 7,7;
EXECUTE sp_insertTrabalha 8,8;
EXECUTE sp_insertTrabalha 9,9;
EXECUTE sp_insertTrabalha 10,10;
EXECUTE sp_insertTrabalha 11,11;
EXECUTE sp_insertTrabalha 12,12;
EXECUTE sp_insertTrabalha 13,13;
EXECUTE sp_insertTrabalha 14,14;

--Pessoa_Singular(CC_Pessoa_Singular,Nif2
EXECUTE sp_insertPessoaSingular 12346,222154988;
EXECUTE sp_insertPessoaSingular 12356,555849985;
EXECUTE sp_insertPessoaSingular 123246,848961861;
EXECUTE sp_insertPessoaSingular 123576,686845168;
EXECUTE sp_insertPessoaSingular 1217886,616841451;
EXECUTE sp_insertPessoaSingular 25255256,265223669;
EXECUTE sp_insertPessoaSingular 252588886,268484294;
EXECUTE sp_insertPessoaSingular 558846,234816984;
EXECUTE sp_insertPessoaSingular 4484586,284138465;
EXECUTE sp_insertPessoaSingular 14586,235138468;
EXECUTE sp_insertPessoaSingular 515156,238413845;
EXECUTE sp_insertPessoaSingular 5151586,235186488;
EXECUTE sp_insertPessoaSingular 54868486,235484868;
EXECUTE sp_insertPessoaSingular 895852476,215536849;

--Empresa

EXECUTE sp_insertEmpresa 'Solventes SA',1351351351,221154988;
EXECUTE sp_insertEmpresa 'MAndau',5165468,551849985;
EXECUTE sp_insertEmpresa 'Carecas do Mundo',864684,841961861;
EXECUTE sp_insertEmpresa 'Astone Martino',84646846,681845168;
EXECUTE sp_insertEmpresa 'Rush',6846846,611841451;
EXECUTE sp_insertEmpresa 'Nuka Cola',84538412,261223669;
EXECUTE sp_insertEmpresa 'Microsoft',846186186,261484294;
EXECUTE sp_insertEmpresa 'Logitech',684123843,231816984;
EXECUTE sp_insertEmpresa 'Samsung',1138438438,281138465;
EXECUTE sp_insertEmpresa 'Trident',535864813,231138468;
EXECUTE sp_insertEmpresa 'MarlBoro',512384684,231413845;
EXECUTE sp_insertEmpresa 'Asus',68438486,231186488;
EXECUTE sp_insertEmpresa 'Toshiba',151668486,231484868;
EXECUTE sp_insertEmpresa 'Oracle',86468468,211536849;


--Itinerario_da_Viagem(ID_v,Local_Partida,Local_Destino,Hora_partida_origem,N_etapas

SET LANGUAGE English;
EXECUTE sp_insertItinerario_de_Viagem 'Lisboa','Madrid','2009-02-05';
EXECUTE sp_insertItinerario_de_Viagem 'Porto','Estarreja','2009-02-05';
EXECUTE sp_insertItinerario_de_Viagem 'Aveiro','Régua','2009-02-09'
EXECUTE sp_insertItinerario_de_Viagem 'Londres','New York','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Frankfurt','Sydney','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Rio Tinto','Bangkok','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Varsóvia','Moscovo','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Lodz','Istambul','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Shangai','Reina','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Albufeira','Vilamoura','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Berlim','Aveiro','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Moscovo','Havana','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Brasilia','Rio de Janeiro','2009-02-09';
EXECUTE sp_insertItinerario_de_Viagem 'Cidade do Cabo','Porto','2009-02-09';


--Transporte(ID_t,Bilhete,Companhia

EXECUTE sp_insertTransporte 2500,'Transdavia';
EXECUTE sp_insertTransporte 3153,'Bike Aveiro';
EXECUTE sp_insertTransporte 3135,'Lufthansa';
EXECUTE sp_insertTransporte 1525,'Moveaveiro';
EXECUTE sp_insertTransporte 3214,'Air Emirates';
EXECUTE sp_insertTransporte 32141,'STCP';
EXECUTE sp_insertTransporte 2314,'TGV';
EXECUTE sp_insertTransporte 4324,'Rede Expressos';
EXECUTE sp_insertTransporte 5123,'Europcar';
EXECUTE sp_insertTransporte 3234,'CP';
EXECUTE sp_insertTransporte 1421,'Metro do Porto';
EXECUTE sp_insertTransporte 31214,'Douro Azul';
EXECUTE sp_insertTransporte 1231,'LusoJet';
EXECUTE sp_insertTransporte 1913,'Ryanair';

--Tipo_Transporte(ID_Tipo_Transporte,ID_transporte_fk,Designacao

EXECUTE sp_insertTipotrans  1,'Avião';
EXECUTE sp_insertTipotrans  2,'Bicicleta';
EXECUTE sp_insertTipotrans  3,'Avião';
EXECUTE sp_insertTipotrans  4,'Autocarro';
EXECUTE sp_insertTipotrans  5,'Barco';
EXECUTE sp_insertTipotrans  6,'Autocarro';
EXECUTE sp_insertTipotrans  7,'TGV';
EXECUTE sp_insertTipotrans  8,'Autocarro';
EXECUTE sp_insertTipotrans  9,'Carro';
EXECUTE sp_insertTipotrans 10,'Comboio';
EXECUTE sp_insertTipotrans 11,'Metro';
EXECUTE sp_insertTipotrans 12,'Barco';
EXECUTE sp_insertTipotrans 13,'Jacto';
EXECUTE sp_insertTipotrans 14,'Avião';

--Etapas(N_Etapa,Preco,Origem,Destino,Hora_de_Partida,ID_transporte_fk1,ID_itinerario_fk1

EXECUTE sp_insertEtapas 123,'Lisboa','Entroncamento','2009-02-09',1,1;
EXECUTE sp_insertEtapas 21,'Entroncamento','Viseu','2009-02-09',2,1;
EXECUTE sp_insertEtapas 15,'Viseu','Malaga','2009-02-09',4,1;

EXECUTE sp_insertEtapas 3,'Porto','Granja','2009-02-09',3,2;
EXECUTE sp_insertEtapas 5,'Granja','Ovar','2009-02-09',3,2;
EXECUTE sp_insertEtapas 6,'Ovar','Estarreja','2009-02-09',3,2;

EXECUTE sp_insertEtapas 7,'Aveiro','Gaia','2009-02-09',3,3;
EXECUTE sp_insertEtapas 2,'Gaia','Porto','2009-02-09',5,3;
EXECUTE sp_insertEtapas 5,'Porto','Régua','2009-02-09',7,3;

EXECUTE sp_insertEtapas 30,'Londres','Madrid','2009-02-09',7,4;
EXECUTE sp_insertEtapas 5,'Madrid','Azores','2009-02-09',2,4;
EXECUTE sp_insertEtapas 80,'Azores','New York','2009-02-09',5,4;

EXECUTE sp_insertEtapas 20,'Frankfurt','Ankara','2009-02-09',4,5;
EXECUTE sp_insertEtapas 50,'Ankara','Bombai','2009-02-09',2,5;
EXECUTE sp_insertEtapas 30,'Bombai','Queensland','2009-02-09',1,5;
EXECUTE sp_insertEtapas 40,'Queensland','Sydney','2009-02-09',6,5;

EXECUTE sp_insertEtapas 2,'Rio Tinto','Porto','2009-02-09',7,6;
EXECUTE sp_insertEtapas 15,'Porto','Frankfurt','2009-02-09',8,6;
EXECUTE sp_insertEtapas 32,'Frankfurt','Ankara','2009-02-09',9,6;
EXECUTE sp_insertEtapas 43,'Ankara','Bangkok','2009-02-09',10,6;

EXECUTE sp_insertEtapas 5,'Varsóvia','Moscovo','2009-02-09',12,7;


EXECUTE sp_insertEtapas 32,'Lodz','Poznan','2009-02-09',5,8;
EXECUTE sp_insertEtapas 231,'Poznan','Ankara','2009-02-09',13,8;
EXECUTE sp_insertEtapas 5,'Ankara','Istambul','2009-02-09',13,8;

EXECUTE sp_insertEtapas 432,'Shangai','Ankara','2009-02-09',12,9;
EXECUTE sp_insertEtapas 23,'Ankara','Reina','2009-02-09',11,9;

EXECUTE sp_insertEtapas 2,'Albufeira','Vilamoura','2009-02-09',2,10;

EXECUTE sp_insertEtapas 50,'Berlim','Porto','2009-02-09',5,11;
EXECUTE sp_insertEtapas 2,'Porto','Aveiro','2009-02-09',7,11;

EXECUTE sp_insertEtapas 32,'Moscovo','Oahu','2009-02-09',8,11;
EXECUTE sp_insertEtapas 2,'Oahu','Havana','2009-02-09',9,11;

EXECUTE sp_insertEtapas 3,'Brasilia','Rio de Janeiro','2009-02-09',1,12;

EXECUTE sp_insertEtapas 3,'Brasilia','Rio de Janeiro','2009-02-09',1,13;


--Reserva (	(identityN_Reserva,Posto_venda_fk ,Nif_Cliente_fk ,Itinerario_fk

EXECUTE sp_insertReserva 1,222154988,1;
EXECUTE sp_insertReserva 2,555849985,2;
EXECUTE sp_insertReserva 3,848961861,3;
EXECUTE sp_insertReserva 4,686845168,4;
EXECUTE sp_insertReserva 5,616841451,5;
EXECUTE sp_insertReserva 6,265223669,6;
EXECUTE sp_insertReserva 7,268484294,7;
EXECUTE sp_insertReserva 7,221154988,8;
EXECUTE sp_insertReserva 7,551849985,9;
EXECUTE sp_insertReserva 6,841961861,10;
EXECUTE sp_insertReserva 5,681845168,11;
EXECUTE sp_insertReserva 4,611841451,12;
EXECUTE sp_insertReserva 2,261223669,13;
EXECUTE sp_insertReserva 1,231816984,14;


-- Estadia (	ID_Estadia,	Morada,	Pais,	Custo,Duracao,	N_Reserva_fk
EXECUTE sp_insertEstadia 'Street random','Portugal',12,5,1;
EXECUTE sp_insertEstadia 'Street random 1','Rio de Janeiro',123,5,2;
EXECUTE sp_insertEstadia 'Street random 2','Havana',65,5,3;
EXECUTE sp_insertEstadia 'Street random 3','Aveiro',45,8,4;
EXECUTE sp_insertEstadia 'Street random 4','Vilamoura',45,2,5;
EXECUTE sp_insertEstadia 'Street random 5','Reina',564,8,6;
EXECUTE sp_insertEstadia 'Street random 6','IIstambul',456,2,7;
EXECUTE sp_insertEstadia 'Street random 7','Moscovo',456,8,8;
EXECUTE sp_insertEstadia 'Street random 8','Bangkok',645,5,9;
EXECUTE sp_insertEstadia 'Street random 9','Sydney',65,8,10;
EXECUTE sp_insertEstadia 'Street random 10','New York',456,8,11;
EXECUTE sp_insertEstadia 'Street random 11','Estarreja',46,8,12;
EXECUTE sp_insertEstadia 'Street random 12','Malaga',45,8,12;


--Recibo(Num_Recibo,Nif_Recibo,Valor,Data,N_Reserva_fk


EXECUTE sp_insertRecibo 222154988,5151,'2009-02-09',1;
EXECUTE sp_insertRecibo 555849985,51531,'2009-02-09',2;
EXECUTE sp_insertRecibo 848961861,51251,'2009-02-09',3;
EXECUTE sp_insertRecibo 686845168,51251,'2009-02-09',4;
EXECUTE sp_insertRecibo 616841451,51521,'2009-02-09',5;
EXECUTE sp_insertRecibo 265223669,51151,'2009-02-09',6;
EXECUTE sp_insertRecibo 268484294,51551,'2009-02-09',7;
EXECUTE sp_insertRecibo 221154988,51651,'2009-02-09',8;
EXECUTE sp_insertRecibo 551849985,51571,'2009-02-09',9;
EXECUTE sp_insertRecibo 841961861,51581,'2009-02-09',10;
EXECUTE sp_insertRecibo 681845168,51591,'2009-02-09',11;
EXECUTE sp_insertRecibo 611841451,51501,'2009-02-09',12;
EXECUTE sp_insertRecibo 261223669,515121,'2009-02-09',13;
EXECUTE sp_insertRecibo 261223669,515121,'2009-02-09',14;
