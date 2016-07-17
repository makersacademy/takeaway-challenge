require 'takeaway'



describe 'user stories' do

  it 'as a customer, I can see a list of dishes with prices' do
      takeaway = Takeaway.new
      expect(takeaway.read_menu).to include({ "chips" => 1.00 })
  end

  it 'as a customer, I can select from available dishes' do
    takeaway = Takeaway.new
    expect{takeaway.add("chips", 2)}.not_to raise_error
  end

  it 'as a customer, I can check the total' do
    takeaway = Takeaway.new
    takeaway.add("cheeseburger", 3)
    correct_total_message = "£15.00 is the correct total"
    expect(takeaway.check_total(15)).to eq(correct_total_message)
  end

end


# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
#
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
#
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
#
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
