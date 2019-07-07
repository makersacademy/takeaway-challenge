require 'takeaway'

describe Takeaway do

  it 'prints a menu with items and prices' do
    expect { subject.print_menu }.to output(
      "Pizza - £6\n" +
      "Fried chicken - £4\n" +
      "Cheeseburger - £5\n" +
      "Chips - £3\n"
    ).to_stdout
  end

  it 'selects items from the menu by index' do
    expected_item = { item: 'Fried chicken', price: 4 }
    expect(subject.select_item(1)).to eq expected_item
  end
end
