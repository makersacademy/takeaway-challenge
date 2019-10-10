require 'takeaway'

describe Takeaway do

  let(:name) {double "name"}
  let(:price) {double "price"}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'displays the menu' do
    allow(subject).to receive(:show_menu) do |name, price|
    expect(name , price).to eq(name, price)
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'adds a dish and its quantity to order' do

  end
end
