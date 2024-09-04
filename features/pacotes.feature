# language: pt

Funcionalidade: Busca de pacotes de viagem
    Sendo uma pessoa que deseja curtir uma viagem com a familia
    Quero realizar buscas de pacotes para minhas férias
    Para que possa escolher a melhor opção disponivel   

    @BuscaHospedagens
    Cenário: Busca de passagens aéreas de ida e volta para 2 Adultos, 1 Criança
        Dado que acesso o site da zupper
        E clique no menu pacotes
        Quando inserir origem, destino, data ida, data volta, numero de viajantes/quartos 
        E clicar em buscar
        Então serão exibidos as melhores opções de pacotes
