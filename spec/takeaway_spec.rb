require 'takeaway'

describe Takeaway do
  let(:menu) { Menu.new[dish: "Dumplings", price: 4.99]}

  it 'display the list of dishes and prices' do
    takeaway = Takeaway.new
    expect(takeaway.menu).to eq(menu.generate_menu)
  end
end

