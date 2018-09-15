require 'calculator'

describe Calculator do
  let(:mock_array) { double :mock_array }

  it "calculates a total" do

    calculator = Calculator.new
    expect(calculator.calculate_total([{ Dish: "Pork", Price: "5"}, { Dish: "Rice", Price: "3"}])).to eq(8)
    end

end
