require 'order.rb'

describe Order do
    subject (:order) {Order.new}
    it 'adds user order to basket' do
        order.selection("Bruschetta", 5)
        expect(order.basket).to eq (5*({:"Bruschetta" => 2.00}))
    end
end