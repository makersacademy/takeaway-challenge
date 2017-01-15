require 'list'

describe 'User stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'shows a list of dishes with prices' do
    dishes = {lasagna: 4.50, pizza: 7.50, steak: 17.50}
    list = List.new(dishes)
    expect(list.show_dishes).to eq "lasagna £4.5 | pizza £7.5 | steak £17.5"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  xit "select a number of dishes" do
    expect(order.select_dishes(name, quantity)).to eq
  end

end
