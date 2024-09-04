# language: pt

Funcionalidade: Busca de hospedagens
    Sendo uma pessoa que precisa ir trabalhar em outro estado
    Quero realizar buscas de hospedagens
    Para que possa ficar enquanto desenvolver minhas atividades  

    @BuscaHospedagens
    Cenário: Busca de passagens aéreas de ida e volta para 2 Adultos, 1 Criança
        Dado que acesso o site da zupper
        E clique no menu hospedagens
        Quando inserir origem, destino, numero de hóspedes, idade da criança, data entrada, data de saída e idade 
        E clicar em buscar
        Então serão exibidos as melhores opções de hospedagens

    