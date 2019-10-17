require 'takeaway'
describe Order do
  menu = MainMenu.new
  subject(:order) { Order.new('curry', menu) }
  it 'should send menu' do
    test = double(dishes: {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00})
    check = Order.new('curry', test)
    test_menu = {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00}
    expect(check.set_menu).to eq(test_menu)
  end
  it 'should let you choose items' do
    expect(Order.new('pizza, curry', menu).items).to eq(('pizza, curry'))
  end
  it 'should confirm total' do
    total = Total.new
    customer = Order.new('pizza, curry', menu, total)
    customer.set_menu
    expect(customer.confirm_total).to eq("pizza = 5.0 curry = 2.2 total = £7.2")
  end
  it 'texts conformation through order' do
    total = Total.new
    puts 'enter number'# this works with full coverage but i canot push with the real api keys
    number = gets.chomp
    delivery = DeliveryTime.new(number)
    customer = Order.new('pizza, curry', menu, total, delivery)
    expect(customer.send).to eq('sent')
  end
end
