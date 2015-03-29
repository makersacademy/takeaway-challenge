require 'capybara/rspec'

feature 'a takeaway can be ordered' do
  let(:order) { Order.new }
  let(:menu) { Menu.new }

  scenario 'an item can be added to the order from the menu' do
    order.add(menu.item(1))
    expect(order.total_items).to eq 1
  end

  scenario 'the total number of items in the'

  scenario
end
