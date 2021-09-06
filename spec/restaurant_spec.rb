require 'restaurant'

describe Restaurant do
  
  it 'shows the menu' do
    menu = "Fries - £2\nMilkshake - £4\n"
    expect { subject.display_menu }.to output(menu).to_stdout
  end

  it 'can add a meal to the order' do
    subject.add_meal("Curry")
    expect(subject.order).to eq([["Curry", 1]])
  end

  it 'can print the order, plus the total cost' do
    subject.add_meal("Fries")
    subject.add_meal("Milkshake")
    expect { subject.display_order }.to output("1x Fries - £2\n1x Milkshake - £4\nOrder total: £6\n").to_stdout
  end
end