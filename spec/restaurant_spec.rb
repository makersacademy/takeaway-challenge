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
end