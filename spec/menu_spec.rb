require 'menu'

describe Menu do
  it 'can display a food item' do
    expect(subject.display).to include('margherita')
  end

  it 'can display all food items with their prices' do
    expect(subject.display).to eq({
      "margherita" => 8,
      "pepperoni"  => 9,
      "vegetarian" => 9
    })
  end

  it 'allows user to choose items to move to basket' do
    basket = Basket.new
    subject.order('margherita')
    subject.order('pepperoni')
    expect(basket).to eq ['margherita','pepperoni']
  end
end
