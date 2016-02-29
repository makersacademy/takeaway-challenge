require 'takeaway'

describe Takeaway do
	subject(:takeaway) { described_class.new }

  before do
    allow(subject).to receive(:send_text)
  end

	it 'has a list of dishes with prices' do
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
		takeaway.menu
		expect(takeaway.menu).to include("Burger"=>10)
	end

  it 'can order a number of dishes' do
#   As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
    takeaway.order("Burger", 1)
    takeaway.order("Shake", 1)
    expect(takeaway.confirm_order).to include("Burger","Shake")
  end

  it 'totals my order for verification' do
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
    takeaway.order("Burger", 2)
    takeaway.order("Shake", 2)
    #takeaway.confirmed_order(30)
   # expect(takeaway.order_total(30)).to eq(true)
  end

  it 'sends a text with order & delivery confirmation' 
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
    # takeaway.order("Burger", 2)
    # takeaway.confirmed_order(20)
    # #expect(takeaway).to receive(:send_text).with("Thank you for your order! Your total is #{takeaway.order_total}")
  #end
end