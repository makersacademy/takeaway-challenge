require 'order.rb'

describe Order do
    subject (:order) {Order.new}
    it 'adds user order to basket' do
        order.selection("Bruschetta", 5)
        expect(order.basket).to include ("Bruschetta")
        expect(order.basket).to include (5)
    end
end