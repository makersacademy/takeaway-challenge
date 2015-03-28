require 'takeaway'

context 'Takeaway' do
  takeaway = Takeaway.new

  it 'knows Bob is their customer' do
    expect(takeaway.customer 'Bob').to eq 'Bob'
  end

  it 'knows their menu contains 3 selections' do
    expect(takeaway.menu.count).to eq 3
  end

  it 'knows meal_small costs 5' do
    expect(takeaway.menu[:meal_small]).to eq 5
  end

  it 'knows meal_medium costs 10' do
    expect(takeaway.menu[:meal_medium]).to eq 10
  end

  it 'knows meal_large costs 15' do
    expect(takeaway.menu[:meal_large]).to eq 15
  end

  it 'can let a customer view the menu' do
    menu_string = "meal_small: £5\nmeal_medium: £10\nmeal_large: £15\n"
    expect(takeaway.show_menu).to eq menu_string
  end
end
