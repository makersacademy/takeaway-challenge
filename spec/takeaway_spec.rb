require 'takeaway'
describe Order do
  it 'should send menu' do
    menu = MainMenu.new
    expect(subject.set_menu).to eq(menu.dishes)
  end
  it 'should let you choose items' do
    expect(Order.new('pizza, curry').items).to eq(('pizza, curry'))
  end
  it 'should confirm total' do
    customer = Order.new('pizza, curry')
    customer.set_menu
    expect(customer.confirm_total).to eq("pizza = 5.0 curry = 2.2 total = £7.2")
  end
  it 'texts conformation through order' do
    puts 'enter number'
    number = gets.chomp
    expect(subject.send(number)).to eq('sent')
  end
end
