require "menu"

describe Menu do

  context "#initialize" do
    it "shows the menu items" do
    message = { "1. Burger" => 5, "2. Fish" => 7, "3. Chips" => 2, "4. Chicken wings" => 3 }
    expect(subject.items).to eq(message)
    end
  end

  context "#display" do
    it "shows the menu and price" do
      message = "1. Burger £5\n2. Fish £7\n3. Chips £2\n4. Chicken wings £3\n"
      expect { subject.display }.to output(message).to_stdout
    end
  end
end