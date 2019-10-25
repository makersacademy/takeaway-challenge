require_relative 'item'
#require 'twilio-ruby'

class Menu
    attr_reader :basket, :menu

    def initialize()
        @basket = []
        @menu = [Item.new("Pizza", 3.99), Item.new("Burger", 4.99), Item.new("Fries", 2.99)]
    end

    def AddToBasket(itemName, quantity)
        @menu.each do |item|
            if item.name == itemName
                quantity.times do
                    @basket << item
                end
            end
        end
    end

    def GetTotal
        total = 0
        @basket.each do |item|
            total += item.price
        end
        return total
    end

    def PurchaseOrder
=begin
        @client = Twilio::REST::Client.new(
            ENV['ACCOUNT_SID'],
            ENV['AUTH']
          )

        @client.messages.create(
            from: "",
            to: "",
            body: "Your food will be delivered within an hour!"
          ) 
=end

          return true 
    end
end