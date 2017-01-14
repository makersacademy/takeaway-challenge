require 'list'

describe 'User stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'shows a list of dishes with prices' do
    list = List.new
    expect(list.show_dishes).to eq "lasagna £4.5 | pizza £7.5 | steak £17.5"
  end
end
