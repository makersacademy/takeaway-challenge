
describe 'User Stories' do

  let(:order) { Order.new }
  let(:menu) { Menu.new }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'displays a menu of dishes with prices, so a customer can decide what to order' do
    expect(menu.view).to eq SmarterCSV.process('./Mann_Fang_Lowe_Menu.csv')
  end

end
