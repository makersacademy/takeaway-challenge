describe 'user stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so a customer can see a menu, it has a list of dishes' do
    joes = Joes.new
    expect(joes.menu).to include('Startes', 'Mains', 'Sides', 'Desserts')
  end

end
