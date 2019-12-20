require 'takeaway.rb'

describe Takeaway do
  let (:takeaway) {Takeaway.new(menu: menu)}
  let (:menu) { double(:menu, print: printed_menu)}
  #let (:print) {double (:printed_menu)}
  let (:printed_menu) {"Special Fried Rice: £6.50"}

  it 'allows user to see a list of dishes with prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end