describe 'User Stories' do

let(:takeaway) { Takeaway.new(menu: menu) }
let(:menu) { double(:menu, print: printed_menu) }
let(:printed_menu)  { "Chicken: £2.00" }

#As a customer
#So that I can check if I want to order something
#I would like to see a list of dishes with prices
it "displays menu so that user can see dishes and prices" do
takeaway = Takeaway.new(menu: menu)
expect(takeaway.show_menu).to eq(printed_menu)
end


#As a customer
#So that I can order the meal I want
#I would like to be able to select some number of several available dishes

#As a customer
#So that I can verify that my order is correct
#I would like to check that the total I have been given matches the sum of the various dishes in my order

#As a customer
#So that I am reassured that my order will be delivered on time
#I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
