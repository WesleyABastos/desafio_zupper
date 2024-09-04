# Desafio Zupper 🚀

## *Automação de Testes com Ruby* 
### Nesse projeto utilizamos: 

* Ruby: linguagem de fácil entendimento, com uma baixa curva de aprendizado. Tem suporte para automações WEB, API e Mobile (utilizando appium);
* Capybara: DSL com suporte integrado ao Selenium;
* Cucumber: suporta implementação de especificações em formato estruturado usando Gherkin;
* Logs: contem os reports gerados pela execução dos testes;
* Page Objects Model: utilizando na pasta pages para encapsulamento e segmentação de responsabilidades, temos um ganho na organização e reaproveitamento de código nas páginas, conforme numero de features vão sendo criadas;
* Selenium Webdriver: gem que possibilita as interações através do chromedriver com o navegador;
* Rspec: gem que possibilita usar asserções de forma mais intuitiva.

> Estrutura do Projeto: 📂

- features: contem as pastas de Steps definitions e Support;
- Steps: onde implementamos os steps gerados pelo cucumber;
- Support: onde inserimos nossa .
- Pages: implementação do Page Objects separando as classes distintas por arquivos ruby
- **report.html:** Relatório de execução dos testes em formato HTML.


> Pré-requisitos ⚡

**Ruby** _ baixar a versão recomendada 3.1.2
**Chromedriver** _ baixar a de acordo com a versão do navegador

Instalação ⚙️
- Bundler:
Rodar o seguinte comando para atualização do bundler: ```gem install bundler```
Gems utilizadas:
⚠️ Com o repositório devidamente clonado, entrar no diretório raiz do projeto com o terminal e rodar o seguinte comando para instalação das gems do projeto: ```bundle install```

> Como rodar a automação 🔥

Com as gems instaladas, ainda dentro do diretório raiz do projeto, executar o comando abaixo para rodar o Cenário **Busca de passagens aéreas de ida e volta para 2 Adultos, 1 Criança e 1 Bebê**:

```cucumber -t @BuscaVoos```


> Reports 📂

- Ao finalizar a execução, o report HTML report.html será gerado na pasta logs.


> **Observações do BDD ⚠️**

O Cenário Busca de passagens aéreas de ida e volta para 2 Adultos, 1 Criança e 1 Bebê que foi automatizado descreve o fluxo básico de uma busca bem-sucedida, sem considerar casos de erro ou funcionalidades adicionais (filtros, erros, etc.).

Neste cenário envolveu a interação com os elementos da página, inclusive com Iframe iniserido no projeto (campos de entrada, botões, etc.) e verificar se os resultados exibidos estão corretos.

Nesse projeto descrevi muitos cenários de sucesso para Busca de Voos e outros arquivos com pelo menos um cenário de sucesso para hospedagem e pacotes. 
