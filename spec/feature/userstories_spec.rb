require 'takeaway'

RSpec.describe 'user stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'shows the list of dishes' do
    takeaway = Takeaway.new
    expect { takeaway.show_menu }.not_to raise_error
    expect(takeaway.show_menu).to eq Takeaway::MENU
  end

  # As a customer
  # So that I can order the meal I want 
  # I would like to be able to select some number of several available dishes

  it 'return a list of selected dishes and their number' do
    takeaway = double(Takeaway.new)
    allow(takeaway).to receive(:select).and_return({ :olives => 2, :pizza => 1 })
    expect(takeaway.select).to eq({ :olives => 2, :pizza => 1 })
    expect { takeaway.select }.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'return the total for the customer to check if is corret' do
    takeaway = Takeaway.new
    quantity = 5
    dish = :olives
    takeaway.bills(dish, quantity)
    allow($stdin).to receive(:gets).and_return(20.0)
    total = $stdin.gets
    expect(takeaway.check_total(total)).to eq(true)
    end

end
