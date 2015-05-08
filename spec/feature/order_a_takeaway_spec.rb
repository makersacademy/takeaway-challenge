require 'capybara/rspec'

feature 'a takeaway can be ordered' do
  let(:order) { Order.new }
  let(:menu) { Menu.new }
  let(:print) { Print.new }
  let(:shop) { Shop.new }
  let(:rob) { Customer.new(name: 'Rob', tel: '+7777000000', pcode: 'AA1 1ZZ') }
  before(:each) { allow(shop).to receive(:send).with(any_args) { 'sent' } }

  scenario 'the menu can be viewed' do
    expect { print.read(menu) }.to output.to_stdout
  end

  scenario 'more than one item can be added to the order from the menu' do
    order.add!(menu.item(1), 1)
    order.add!(menu.item(2), 2)
    expect(order.total_items).to eq 2
  end

  scenario 'can check the order before purchase' do
    order.add!(menu.item(1), 1)
    order.add!(menu.item(2), 2)
    expect { print.check(order) }.to output.to_stdout
  end

  scenario 'a shop can take an order' do
    order.add!(menu.item(1), 1)
    order.add!(menu.item(2), 2)
    order.add!(menu.item(3), 1)
    shop.take_order!(order, rob)
    expect(shop.total_orders).to eq 1
  end

  scenario 'user receives a text to confirm order' do
    order.add!(menu.item(1), 1)
    expect(shop.take_order!(order, rob)).to eq 'sent'
  end

end
