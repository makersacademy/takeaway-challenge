require 'menu'

describe Menu do

  it 'allows user to view a list of food items and prices' do
    expect(subject.menu_list).to include(
      {:dish => "kebab" , :price => 5 },
      {:dish => "curry" , :price => 6 },
      {:dish => "pizza" , :price => 4 },
      {:dish => "sushi" , :price => 8 },
      {:dish => "burrito" , :price => 6 }
    )
  end

  describe '#initialize' do
    it 'initially creates an empty basket' do
      expect(subject.basket).to be_empty
    end
  end


  describe '#add_to_basket' do
    let(:dish) {double :dish}
    it { is_expected.to respond_to(:add_to_basket).with(1).argument }
  end

    it 'returns the users choice of dish' do
      expect(subject.add_to_basket(:dish)).to eq [:dish]
    end

    it 'places dish in basket' do
      subject.add_to_basket(:dish)
      expect(subject.basket).to include :dish
    end


end
