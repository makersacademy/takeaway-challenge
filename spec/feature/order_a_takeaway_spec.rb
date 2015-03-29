require 'capybara/rspec'

feature 'a takeaway can be ordered' do
  let(:order) { Order.new }
  let(:menu) { Menu.new }
  let(:print) { Print.new }
  let(:shop) { Shop.new }
  let(:rob) { Customer.new(name: 'Rob', tel: 00000000000, postcode: 'AA1 1ZZ') }

  scenario 'an item can be added to the order from the menu' do
    order.add(menu.item(1))
    expect(order.total_items).to eq 1
  end

  scenario 'can check the order before purchase' do
    order.add(menu.item(1))
    expect { print.check(order) }.to output.to_stdout
  end

  scenario 'a shop can take an order' do
    order.add(menu.item(1))
    shop.take_order(order, rob)
    expect(shop.total_orders).to eq 1
  end

  xscenario 'user receives a text to confirm order' do

  end

end
