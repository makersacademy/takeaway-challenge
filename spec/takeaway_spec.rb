require 'takeaway'

context 'Takeaway knows' do
  let(:takeaway) { Takeaway.new }

  before do
    takeaway.customer 'Bob', '07951761165'
  end

  it 'Bob is their customer' do
    expect(takeaway.customer_name).to eq 'Bob'
  end

  it 'Bob\'s number is 07951761165' do
    expect(takeaway.customer_number).to eq '07951761165'
  end

  it 'their menu contains 3 selections' do
    expect(takeaway.menu.count).to eq 3
  end

  it 'meal-small costs 5' do
    expect(takeaway.menu[:"meal-small"]).to eq 5
  end

  it 'meal-medium costs 10' do
    expect(takeaway.menu[:"meal-medium"]).to eq 10
  end

  it 'meal-large costs 15' do
    expect(takeaway.menu[:"meal-large"]).to eq 15
  end
end

context 'Takeaway lets the customer' do
  let(:takeaway) { Takeaway.new }

  it 'view the menu' do
    menu_string = "Meal-small: £5\nMeal-medium: £10\nMeal-large: £15\n"
    expect(takeaway.show_menu).to eq menu_string
  end

  it 'order one item' do

  end
end
