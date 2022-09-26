require './lib/receipt.rb'

RSpec.describe Receipt   do

    it " returns total of order" do
        dish_1 = double :dish, name: "sandwich", price: 10
        dish_2 = double :dish, name: "salad", price: 5
        dish_3 = double :dish, name: "soup", price: 3
        order = double :order, list: [dish_1, dish_2,dish_3]
        receipt = Receipt.new(order)
        expect(receipt.total).to eq (18)
    end
    it "returns an itemised receipt" do
        dish_1 = double :dish, name: "sandwich", price: 10
        dish_2 = double :dish, name: "salad", price: 5
        dish_3 = double :dish, name: "soup", price: 3
        order = double :order, list: [dish_1, dish_2,dish_3]
        receipt = Receipt.new(order)
        receipt.total
        expect(receipt.itemised_receipt).to eq "Items totalled: sandwich £10 /salad £5 /soup £3 / Total amount: £18"
    end


end