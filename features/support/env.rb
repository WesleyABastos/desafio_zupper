require "capybara"
require "capybara/cucumber"

Capybara.default_max_wait_time = 5

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
end