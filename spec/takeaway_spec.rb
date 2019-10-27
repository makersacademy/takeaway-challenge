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
require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:selected_dishes) do
    {
      Pepperoni: 2,
      Hawaiian: 1
    }
  end

  it 'shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to include("Pepperoni: £8")
  end

  it 'shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to include("Margherita: £6")
  end

  before do
    allow(takeaway).to receive(:has_dish?).with("Pepperoni").and_return(true)
    allow(takeaway).to receive(:has_dish?).with("Hawaiian").and_return(true)
  end

  it 'can select some number of several available dishes' do
    takeaway.add("Pepperoni", 2)
    takeaway.add("Hawaiian", 1)
    expect(selected_dishes).to eq(selected_dishes)
  end

  it 'doesnt allow items not on the menu to be added' do
    expect { takeaway.add("Chicken", 3) }.to raise_error "Chicken is not on the menu!"
  end

end
