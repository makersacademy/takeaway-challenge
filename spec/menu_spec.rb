require "menu"

describe Menu do
  it { is_expected.to be_a Menu }
  it { is_expected.to have_attributes(:menu => { "Salad" => 5 ,
    "Pizza" => 8 ,
    "Pasta" => 9 ,
    "Ice Cream" => 5 ,
    "Still Water" => 2.50 ,
    "Pepsi" => 3.00 })}

  describe "#display" do
    it "is expected to display the menu" do
      expect(subject.display).to eq "Salad" => 5, "Pizza" => 8, "Pasta" => 9, "Ice Cream" => 5, "Still Water" => 2.5, "Pepsi" => 3.0
    end
  end
end
