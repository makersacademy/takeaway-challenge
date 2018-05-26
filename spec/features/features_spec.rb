require 'cafe'

describe 'Feature tests' do
  let(:cafe) { Cafe.new }
  let(:menu) { Menu.new }

  # User Story 1:
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'shows a list of dishes with prices' do
    expect(cafe.display).to eq menu.juices
  end

  # User Story 2:
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

end
