
describe 'User Stories' do
  let(:takeaway) { Takaway.new}
  let(:order) { Order.new }
  let(:menu) { Menu.new }
  let(:dish_number) { 1 }
  let(:quantity) { 3 }
  let(:selection) { [
    {:dish=>"Chop Sooy, With White Mushrooms", :price => 2.50 },
    {:dish=>"Chop Sooy, With White Mushrooms", :price => 2.50 },
    {:dish=>"Chop Sooy, With White Mushrooms", :price => 2.50 }
  ]
  }

  before do
    $stdin = StringIO.new("1")
  end
  after do
    $stdin = STDIN
  end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'displays a menu of dishes with prices, so a customer can decide what to order' do
    expect(menu.view).to eq SmarterCSV.process('./Mann_Fang_Lowe_Menu.csv')
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'allows a customer to select a number of available dishes' do
    order.add(dish_number, quantity)
    expect(order.selection).to eq selection
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'allows user to verify order by checking the total against the sum of the dishes selected' do
    total = 7.50
    order.add(dish_number, quantity)
    expect(order.total).to eq total

  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


end
