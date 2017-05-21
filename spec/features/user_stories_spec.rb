require_relative '../spec_helper'
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe 'takeaway' do
  it 'so customers can select their order, display a list of dishes' do
    order = Order.new
    expect(order.view_menu).to eq(Menu::LIST_OF_DISHES)
  end
end
