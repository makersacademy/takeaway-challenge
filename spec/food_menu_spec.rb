require 'food_menu'

describe FoodMenu do

  subject(:food_menu) { FoodMenu.new(food) }
  let(:food) { {pizza: '5.00'} }

  it 'contains a list of yummy dishes with their prices' do
    expect(food_menu.food).to eq(food)
  end

  context '#print' do

    it 'prints the list of yummy dishes with their prices' do
      expect(food_menu.print).to eq("Pizza: 5.00")
    end

  end

end