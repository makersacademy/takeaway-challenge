describe 'User stories' do
  subject(:takeaway) {Takeaway.new}
  subject(:menu) {Menu.new}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'returns list with dishes and prices' do
   expect(menu.list[:Beer]).to eq 1.5
  end
end
