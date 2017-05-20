require "menu"

describe Menu do
subject(:menu) { described_class.new }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  describe "#list_of_dishes" do
    it "should show a list of dishes with the prices" do
      expect(menu.list_of_dishes).to eq({
        "chicken" => (sprintf "%.2f","4.99"),
        "fish" => (sprintf "%.2f", 5.50),
        "beef" => (sprintf "%.2f", 4.99),
        "vegetarian" => (sprintf "%.2f", 4.50)
      })
    end
  end
end
