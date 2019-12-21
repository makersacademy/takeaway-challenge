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
      subject.insert_meal('Tofu',2.50)
      expect(subject.dishes['Tofu']).to eq 2.50
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
end
