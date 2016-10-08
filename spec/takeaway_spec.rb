require "takeaway"
#require "menu"

describe Takeaway do
  let(:takeaway) { (Takeaway.new) }


  it "shows a list of dishes with prices" do
    takeaway
    expect(takeaway.show_menu).to eq takeaway.menu
  end


  it "should be able to select a number of available dishes" do
    takeaway.customer_choice
  expect(takeaway.show_order).to eq customer_choice
  end

end



#   So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order



# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
