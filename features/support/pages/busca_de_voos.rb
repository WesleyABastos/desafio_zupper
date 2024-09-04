class BuscaPage
    include Capybara::DSL

    def abrir_site
        visit "https://www.zupper.com.br/"
    end

    def alert_cookies
        within(all('#vv_wp_optIn_div')[0]) do  # interage com alert dentro do iframe
            within_frame(find('iframe[src*="zupper-wp.vendavalida.com.br/webpush/optinPopup"]')) do
                find('#push-container .push-container__btn-close').click
            end
        end
        find(".oPrivallyApp-BarCookies")
        find("#oPrivallyApp-AcceptLink").click  # Aceite de todos os Cookies
    end

    def origem
        within(:xpath, "//*[@data-zt='flightSearchOrigin']") do
            find(:xpath, "(.//*[@data-zt='airportSelectionInput'])[1]").click
            find(:xpath, "(.//*[@data-zt='airportSelectionInput'])[1]").set('São Paulo')
            using_wait_time 2 do
                find(:xpath, "//span[@data-zt='airportName' and @data-zt-value='CGH']").click
            end
        end
    end

    def destino
        within(:xpath, "//*[@data-zt='flightSearchDestination']") do
            find(:xpath, "(.//*[@data-zt='airportSelectionInput'])[1]").click
            find(:xpath, "(.//*[@data-zt='airportSelectionInput'])[1]").set('Natal')
            using_wait_time 2 do
                find(:xpath, "//span[@data-zt='airportName' and @data-zt-value='NAT']").click
            end
        end
    end

    def periodo
        require 'date'
        @data_atual = Date.today  # Obter a data atual
        @data_ida = @data_atual + 5
        @data_volta = @data_ida + 7
        @data_ida_formatada = @data_ida.strftime('%Y-%m-%d')
        @data_volta_formatada = @data_volta.strftime('%Y-%m-%d')
        # Agora interagir com os campos de data na página
        find(:xpath, "//*[@data-zt='calendarTrigger']").click
        find(:xpath, "//span[@data-zt='calendarDate' and @data-zt-value='#{@data_ida_formatada}']").click
        find(:xpath, "//span[@data-zt='calendarDate' and @data-zt-value='#{@data_volta_formatada}']").click
    end

    def quantidade_passageiros
        find(:xpath, "//input[@data-zt='passengersConfigTrigger']").click
        find(:xpath, "//span[@data-zt='passengersConfigAddAdult']").click
        find(:xpath, "//span[@data-zt='passengersConfigAddChild']").click
        find(:xpath, "//span[@data-zt='passengersConfigAddInfant']").click
    end

    def validacao_passageiros
        # Confirmar a seleção de passageiros no data-zt 'confirmPassengerSelection'
        find(:xpath, "//button[@data-zt='confirmPassengerSelection']").click if page.has_xpath?("//button[@data-zt='confirmPassengerSelection']")
    end
    
    def botao_buscar
        page.save_screenshot('informações_da_busca.png')
        find(:xpath, "//button[@data-zt='flightSearchSubmit']").click
    end

    def melhores_preços
        # Esperar até que o elemento 'priceMatrix' seja carregado
        if page.has_xpath?("//article[@data-zt='priceMatrix']", wait: 50)

            # Verificar se os preços estão carregados na coluna de melhores preços
            if page.has_xpath?("//article[@data-zt='priceMatrix']//td[@class='best-prices']/span", wait: 30)
                best_prices = all(:xpath, "//article[@data-zt='priceMatrix']//td[@class='best-prices']/span")
                if best_prices.any? { |price| !price.text.strip.empty? } # Verificar se os preços estão visíveis
                    sleep 10
                    page.save_screenshot('melhores_tarifas.png')
                    ofertas = 1
                    best_prices.each do |price|
                        unless price.text.strip.empty?
                            puts "#{ofertas}. Melhor preço encontrado: #{price.text}"
                            ofertas += 1
                        end
                    end
                else
                    puts "Os preços estão visíveis, mas nenhum valor foi encontrado."
                end
            else
                puts "Os preços não foram carregados."
            end
        else
            puts "As melhores ofertas não foram carregadas a tempo ou encontradas na página."
        end
    end

    def voos_encontrados
        # Verificar se o elemento que contém o número de voos está presente
        if page.has_xpath?("//h6[contains(text(), 'voos encontrados')]")
            flight_info = find(:xpath, "//h6[contains(text(), 'voos encontrados')]").text
            if flight_info.match(/\d+/)[0].to_i > 0    # Extrair o número de voos voos encontrados"
                puts "Voos encontrados: #{flight_info.match(/\d+/)[0]}"
            else
                puts "Nenhum voo encontrado."
            end
        else
            puts "O número de voos não foi encontrado na página."
        end

        4.times do |i|
            page.execute_script('window.scrollBy(0, window.innerHeight)')
            sleep 3
            page.save_screenshot("voos_encontrados_#{i + 1}.png")
        end
    end
end