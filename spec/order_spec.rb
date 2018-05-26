require 'order'
require 'menu'

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

describe Order do
  let(:order) { Order.new }

  it 'responds to add_item' do
    expect(subject).to respond_to(:add_item).with(2).arguments
  end

  before do
    subject.add_item("sushi", 3)
  end

  it 'adds the selection to the basket' do
    expect(subject.basket).to include ["sushi", 3]
  end


  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order


  it 'calculates the total cost of food' do
    expect(subject.total).to eq 15
  end

end
