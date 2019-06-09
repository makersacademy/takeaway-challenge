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

end
