require 'cafe'

describe 'Feature tests' do
  let(:cafe) { Cafe.new }
  let(:menu) { Menu.new }
  let(:order) { Order.new }

  # User Story 1:
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'shows a list of juices with prices' do
    expect(cafe.display).to eq menu.juices
  end

  # User Story 2:
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'selects juices from the menu' do
    expect(cafe.select_juices("Matcha Greens Booster Shot")).to eq cafe.show_basket
  end

  # User Story 3:
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'checks the total I have been given' do
    cafe.select_juices("Matcha Greens Booster Shot")
    expect(cafe.check_total(2.49)).to eq [2.49]
  end

end
