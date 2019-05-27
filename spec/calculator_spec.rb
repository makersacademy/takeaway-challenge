require 'calculator'

describe Calculator do
  let(:calculator)        { Calculator.new }
  let(:food_item_1)       { double(:food_item_1, price: 15.00) }
  let(:food_item_2)       { double(:food_item_2, price: 5.00) }

  it 'determine the total price of an order' do
    summarised_order = { food_item_1 => 1, food_item_2 => 3 }
    expect(calculator.total(summarised_order)).to eq(30.00)
  end
end
