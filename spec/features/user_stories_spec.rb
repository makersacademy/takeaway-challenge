describe 'User stories' do
  subject(:takeaway) {Takeaway.new}
  subject(:menu) {Menu.new}

  # User story 1
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'returns list with dishes and prices' do
   expect(menu.list[:Beer][:Price]).to eq 7.00
  end

  # User story 2
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

end
