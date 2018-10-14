require 'takeaway'
require 'basket'
require 'pry'

describe Takeaway do
  let(:menu) { double(:menu) }
  let(:takeaway) { double(:takeaway) }

  it 'can display a food item' do
    expect(subject.display_menu).to include('margherita')
  end

  it 'can display all food items with their prices' do
    expect(subject.display_menu).to eq({
      "margherita" => 8,
      "pepperoni"  => 9,
      "vegetarian" => 9
    })
  end

  it 'puts ordered items in a basket' do
    subject.order('margherita')
    subject.order('pepperoni')
    expect(subject.basket_arr).to eq ['margherita', 'pepperoni']
  end

  it 'allows user to check ordered items and total cost' do
    subject.order('margherita')
    subject.order('pepperoni')
    expect(subject.display_basket).to eq(
      "Your order:\nmargherita: £8\npepperoni: £9\nTotal: £17"
    )
  end

end
