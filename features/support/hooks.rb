Before do 
    @busca = BuscaPage.new
    page.current_window.resize_to(1440, 900)
    # page.driver.browser.manage.window.maximize #Para maximizar a tela não importando a resolução.
end