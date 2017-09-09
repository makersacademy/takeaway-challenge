 require 'order'

 describe Order do
   subject(:order) {Order.new}
   describe "#initialize"
   xit "initialises with zero balance" do
     expect(order.balance).to eq 0
   end
 end
 describe "#total" do

 end
