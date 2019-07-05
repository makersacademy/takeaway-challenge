describe 'these are the user stories' do
  subject(:menu) { Menu.new }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'displays a list of dishes with prices' do
    expect(subject.display_menu).to eq "Fish: £7\nChips: £3"
  end
end
