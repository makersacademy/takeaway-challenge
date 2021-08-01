require 'takeaway.rb'

describe Takeaway do 

  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: menu_list) }
  let(:menu_list) { "Tofu ramen: £2.99" }
  let(:food) { { rice: 2.50, noodles: 2.50 } }
  let(:order) { double(:order) }

  it 'shows menu list with prices' do
    expect(takeaway.display_menu).to eq("Tofu ramen: £2.99")
  end

  it 'can order a number of dishes' do 
    expect(takeaway.place_order(food))
  end

end