require 'capybara/rspec'

feature 'a takeaway can be ordered' do
  let(:order) { Order.new }
  let(:menu) { Menu.new }
  let(:print) { Print.new }

  scenario 'an item can be added to the order from the menu' do
    order.add(menu.item(1))
    expect(order.total_items).to eq 1
  end

  scenario 'can check the order before purchase' do
    order.add(menu.item(1))
    expect { print.check(order) }.to output.to_stdout
  end

end
