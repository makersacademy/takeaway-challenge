require 'Menu'

describe Menu do
  it 'displays the menu to stdout' do
    expect(Menu.displayMenu).to eq "spring roll: 0.99\nchar sui bun: 3.99\npork dumpling: 2.99\npeking duck: 7.99\nfu-king fried rice: 5.99\n"
  end

  it 'checks if menu does not contains item' do
    expect(Menu.containsItem("hi")).to eq false
  end

  it 'checks if menu contains item' do
    expect(Menu.containsItem("spring roll")).to eq true
  end

  it 'returns all items in array' do
    items = ["spring roll", "char sui bun"]
    expect(Menu.getItemAndCost(items)).to eq "spring roll: 0.99\nchar sui bun: 3.99\n"
  end

  it 'returns sum of cost in array' do
    items = ["spring roll", "char sui bun"]
    expect(Menu.getCost(items)).to eq 4.98
  end
end