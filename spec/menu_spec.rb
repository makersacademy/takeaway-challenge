require "menu"

describe Menu do
  it { is_expected.to be_a Menu }
  it { is_expected.to have_attributes(:menu => { "Salad" => 5, "Pizza" => 8, "Pasta" => 9, "Burger" => 5, "Fish & Chips" => 6, "Chips" => 3 })}

  describe "#display" do
    it "is expected to display the menu" do
      expect(subject.display).to eq "Salad" => 5, "Pizza" => 8, "Pasta" => 9, "Burger" => 5, "Fish & Chips" => 6, "Chips" => 3
    end
  end
end
