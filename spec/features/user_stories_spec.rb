require 'takeaway'

describe 'User stories' do
  let(:takeaway)  { Takeaway.new }
  let(:order)     { {'Cheeseburger': 1, 'Fries': 2}}

  it 'brings up list of dishes with prices' do
    menu_items = "Cheeseburger £5.00, Fries £3.00, Milkshake £2.99"
    expect(takeaway.show_menu).to eq(menu_items)
  end

  it 'selects a number of the available dishes' do
    takeaway.add(:'Cheeseburger', 1)
      expect(takeaway.order).to include('Cheeseburger': 1)
    end

  it 'allows the order total to be sum of items added' do
    takeaway.add('Cheeseburger', 1)
    takeaway.add('Cheeseburger', 1)
    expect(takeaway.total).to eq '£10.00'
  end
end
