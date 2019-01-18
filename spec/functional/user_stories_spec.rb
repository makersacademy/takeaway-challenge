# nouns: list, dishes, prices, meal, total, text

# list = object Menu
# dish = subset of Menu
# meal = chosen items
# total =  total price
# takeaway = main program
# text = text object - pass hash, not arguments

require 'Takeaway'

RSpec.describe 'Functional tests' do
let(:pieshop) { Takeaway.new }
let(:menu) {}

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

  it 'shows list of dishes with prices' do
    expect(pieshop.list_menu).to eq menu
  end


end
