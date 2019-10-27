require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, confirmation: confirmation) }
  let(:menu) { double :menu, print: printed_menu }
  let(:printed_menu) { 'Pizza Margherita: £7
    Pepperoni Pizza: £8
    Chicken Supreme: £9
    Vegetarian Supreme: £8' }
  let(:items) { ['Pepperoni Pizza', 'Chicken Supreme'] }
  let(:order) { double :order, total: 25 }
  let(:confirmation) { double :confirmation, deliver: nil }
  
  it 'shows the menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can receive order of a number of dishes' do
    expect(order).to receive(:add).twice
    takeaway.receive_order(items)
  end
  
  it 'knows the total price of the order' do
    total = takeaway.calculate_total(items)
    expect(total).to eq 25
  end
  
  it 'can send a confirmation text' do
    expect(confirmation).to receive(:deliver)
    takeaway.send_confirmation(order)
  end
  
  

end