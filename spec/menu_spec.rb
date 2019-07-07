require 'menu'

describe Menu do

  let(:dish){ Dishes.new("Sandwich", 3)}
  let(:dish2){ Dishes.new("Suppli", 1)}

  it 'returns empty list' do
    expect(subject.dish_list).to eq []
  end

  describe "#add_dish" do
    it "add dishes into a list" do
      subject.add_dish(dish)
      expect(subject.dish_list).to eq [{name: "Sandwich", price: 3}]
    end
  end

  describe "#display_menu" do
    it "display the dishes" do
      subject.add_dish(dish)
      subject.add_dish(dish2)
      expect(subject.display_menu).to eq "1. Sandwich: £3. 2. Suppli: £1. "
    end
  end
end
