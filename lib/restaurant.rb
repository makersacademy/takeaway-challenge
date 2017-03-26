require_relative 'menu'
require 'csv'
# Restaurant class has a takeaway menu for orders to be placed
class Restaurant

    attr_reader :menu
# will need to be initialized with orders, SMS,
    def initialize(menu = Menu.new)
      @menu = menu
      #orders
      #sms
    end

    def menu

    end

    private

    #attr_writer :menu
end 
