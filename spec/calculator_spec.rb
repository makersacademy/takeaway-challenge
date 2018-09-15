require 'calculator'

describe Calculator do
  let(:mock_array) { double :mock_array }

  it "calculates a total" do

    calculator = Calculator.new
    expect(calculator.calculate_total([{ Dish: "Pork", Price: 5} ])).to eq(5)
    end

end
