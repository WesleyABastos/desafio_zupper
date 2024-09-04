Dado('que acesso o site da zupper') do
    @busca.abrir_site
    @busca.alert_cookies
end
  
Quando('inserir as informações da minha viagem') do
    @busca.origem
    @busca.destino
    @busca.periodo
    @busca.quantidade_passageiros
end
  
Quando('clicar em buscar') do
    @busca.botao_buscar
end
  
Então('serão exibidos os voos e as melhores tarifas encontradas') do
    @busca.melhores_preços
    @busca.voos_encontrados
end