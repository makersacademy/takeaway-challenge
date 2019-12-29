require 'menu'

describe Menu do
 describe '#initialize' do
   it 'sets the dishes on the menu' do
     expect(subject.dishes).to be_a Hash
    end
  end

  describe '#insert_meal' do
    let(:meal){'Tofu'}
    let(:price){2.50}
    it 'puts a dish and a price in the Hash' do
      subject.insert_meal(meal,price)
      expect(subject.dishes[meal]).to eq price
    end
  end

  describe '#show_menu' do
    let(:dishes){{'Tofu': 3.50, 'Seitan': 4.00}}
    it 'prints out the menu' do
      subject.dishes = dishes
      printed_menu = "Tofu: 3.50, Seitan: 4.00"
      expect(subject.show_menu).to eq printed_menu
    end
  end

  describe '#has_dish' do
    let(:dishes){{'Tofu' => 3.50, 'Seitan' => 4.00}}
    it "returns true if dish on the menu" do
      subject.dishes = dishes
      dish = 'Tofu'
      result = subject.has_dish(dish)
      expect(result).to eq true
    end
  end

  describe '#price' do
    let(:dishes){{'Tofu': 3.50, 'Seitan': 4.00}}
    it "returns the price of a dish" do
      subject.dishes = dishes
      result = subject.price(:Tofu)
      expect(result).to eq 3.50
    end
  end
end
