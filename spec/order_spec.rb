require 'order'
describe Order do

  it 'should send menu' do
    fake_menu1 = double(dishes: {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00})
    check = Order.new('curry', fake_menu1)
    test_menu = {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00}
    expect(check.set_menu).to eq(test_menu)
  end
  it 'should let you choose items' do
    fake_menu2 = double(dishes: {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00})
    expect(Order.new('pizza, curry', fake_menu2).items).to eq(('pizza, curry'))
  end
  it 'should confirm total' do
    fake_menu3 = double(dishes: {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00})
    total = double(calculate: "pizza = 5.0 curry = 2.2 total = £7.2")
    customer = Order.new('pizza, curry', fake_menu3, total)
    customer.set_menu
    expect(customer.confirm_total).to eq("pizza = 5.0 curry = 2.2 total = £7.2")
  end
  it 'texts conformation through order' do
    fake_menu4 = double(dishes: {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00})
    total = double(total: 0)
    puts 'enter number'# this works with full coverage but i canot push with the real api keys
    number = gets.chomp
    delivery = double(send: 'sent')
    customer = Order.new('pizza, curry', fake_menu4, total, delivery)
    expect(customer.send).to eq('sent')
  end
end
