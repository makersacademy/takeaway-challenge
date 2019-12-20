require 'takeaway.rb'

describe Takeaway do
  let (:takeaway) {Takeaway.new(menu: menu, order: order)}
  let (:menu) { double(:menu, print: printed_menu)}
  let (:order) {double (:order)}
  let (:printed_menu) {"Special Fried Rice: £6.50"}
  let (:dishes) { {rice: 2} }

  it 'allows user to see a list of dishes with prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'allows user to order from a number of available dishes' do
    expect(takeaway.order(dishes)).to eq("Your order total is £13")
  end

end