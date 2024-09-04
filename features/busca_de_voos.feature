# language: pt

Funcionalidade: Busca de Passagens Aéreas
    Sendo uma pessoa que deseja curtir uma viagem com a familia
    Quero realizar buscas de passagens para minhas férias
    Para que possa escolher a melhor opção disponivel  

    @BuscaVoos
    Cenário: Busca de passagens aéreas de ida e volta para 2 Adultos, 1 Criança e 1 Bebê
        Dado que acesso o site da zupper
        Quando inserir as informações da minha viagem
        E clicar em buscar
        Então serão exibidos os voos e as melhores tarifas encontradas

    @BuscaVoo_ida
    Cenário: Busca de passagens aéreas de ida para 1 Adultos, 2 Criança e 1 Bebê
        Dado que acesso o site da zupper
        Quando inserir as informações da minha viagem
        E clicar em buscar
        Então serão exibidos os voos e as melhores tarifas encontradas

    @BuscaVoo_multidestinos
    Cenário: Busca de passagens aéreas para 2 destinos RJ > SP e RJ > Recife 
        Dado que acesso o site da zupper
        Quando inserir as informações das 2 minhas viagens
        E clicar em buscar
        Então serão exibidos os voos e as melhores tarifas encontradas para as 2 datas

    @BuscaVoo_multidestinos
    Cenário: Busca de passagens aéreas para 3 destinos Patos MG > SP e SP > Manaus 
        Dado que acesso o site da zupper
        Quando inserir as informações das minhas 3 viagens
        E clicar em buscar
        Então serão exibidos os voos e as melhores tarifas encontradas para as 3 datas


    @BuscaDinamica @sucesso
    Esquema do Cenario: Busca de voos com informações predefinidas
        Dado que acesso o site da zupper
        E inserir as informações obrigatórias:
            | origem         | destino         | ida        | volta        | passageiros   |
            | <lugar_origem> | <lugar_destino> | <data_ida> | <data_volta> | <passageiros> |
        Quando clicar em buscar
        Então serão exibidos os voos e as melhores tarifas encontradas

    Exemplo:
        | lugar_origem   |   lugar_destino   |  data_ida  | data_volta |          passageiros            |
        |   São Paulo    |      Natal        | 14/10/2024 | 18/10/2024 | 2 adultos + 1 criança + 2 bebes |
        | Rio de Janeiro | Rio Grande do Sul | 11/09/2024 | 13/09/2024 |       1 adulto + 2 criança      |
        |    Paraíba     |      Recife       | 01/10/2024 | 05/10/2024 |       3 adultos + 1 criança     |
        |  divinopolis   |      Manaus       | 13/11/2024 | 15/12/2024 |         1 adulto + 1 bebes      |
    
    @Lista
    Cenário: Tentativa de busca sem selecionar as opções na opção origem 
        Dado que acesso o site da zupper
        Quando digitar o lugar de origem
        Mas não selecionar as opções da listagem
        E clicar em buscar
        Então apresentará os campos obrigatórios em vermelho
    
    @Busca_invalida
    Esquema do Cenario: Tentativa de busca de voos com falta de informações obrigatórias 
        Dado que acesso o site da zupper
        Quando deixar de inserir alguma informação:
            | origem         | destino         | ida        | volta        | passageiros   |
            | <lugar_origem> | <lugar_destino> | <data_ida> | <data_volta> | <passageiros> |
        E clicar em buscar
        Então apresentará os campos obrigatórios em vermelho

    Exemplo:
        | lugar_origem   |   lugar_destino   |  data_ida  | data_volta |          passageiros            |
        |                |      Natal        | 14/10/2024 | 18/10/2024 | 2 adultos + 1 criança + 2 bebes |
        | Rio de Janeiro | Rio Grande do Sul | 11/09/2024 | 00/00/0000 |       1 adulto + 2 criança      |
        |    Paraíba     |                   |            | 05/10/2024 |       3 adultos + 1 criança     |
        |  divinopolis   |        21         | 13/11/2024 | 15/12/2024 |                                 |
