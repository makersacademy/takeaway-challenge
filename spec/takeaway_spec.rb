require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }


  it 'prints a menu with prices' do
    expect(takeaway.print_menu).to eq ["Fish: £2365", "Chips: £1836", "Kebab: £4317"]
  end
  # 
  # it 'confirms that an item has been ordered' do
  #   expect(takeaway.order_item("Fish")).to eq "You have ordered some Fish!"
  # end
end
