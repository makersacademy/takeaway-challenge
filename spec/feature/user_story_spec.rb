
describe 'user stories' do
  subject(:takeaway) { Takeaway.new }
  subject(:menu) { Menu.new }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'returns a list of dishes with prices' do
    expect(menu).to respond_to(:list)
  end

  it 'returns an item from the list' do
    expect(menu.list[:Cobra]).to eq 3.50
  end
  
end
