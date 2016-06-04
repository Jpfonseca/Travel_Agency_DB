USE Sistema;

CREATE NONCLUSTERED INDEX idxPessoa ON Pessoa(CC) INCLUDE (Nome);

CREATE NONCLUSTERED INDEX idxPartida ON Itinerario_da_Viagem(ID_V) INCLUDE(Local_Partida);

CREATE NONCLUSTERED INDEX idxNomeEmpresa ON Empresa(NRegisto) INCLUDE (Nome);
