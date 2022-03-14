require 'takeaway'
describe Takeaway do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'can display list of menu items and prices' do
    expect(subject.menu).to eq(subject.menu_items)
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'can take items from menu and add to order' do
    expect(subject.add_items 1).to change(subject.order).by 1
  end
end
