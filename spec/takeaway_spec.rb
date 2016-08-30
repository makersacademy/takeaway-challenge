require 'takeaway'

describe Takeaway do

  subject {described_class.new}

  describe '#menu' do

    it {is_expected.to respond_to(:menu)}

    it 'creates a new instance of menu instantiation' do
      expect(subject.menu).to be_an_instance_of(Menu)
    end

  end

  describe '#select_dish' do

    it 'confirms that your order selection has been added to basket' do
      expect(subject.select_dish("Edamame",1)).to eq "1 order of 'Edamame' has been added to your basket."
    end

    it 'allows for plural confirmation if quanity is greater than 1' do
      expect(subject.select_dish("Katsu Curry & Rice",3)).to eq "3 orders of 'Katsu Curry & Rice' have been added to your basket."
    end

    it 'deafaults to 1 if no quanity is given' do
      expect(subject.select_dish("Edamame")).to eq "1 order of 'Edamame' has been added to your basket."
    end

    it 'raises an error is item doesnt exist in menu' do
      expect{subject.select_dish("Won Ton Soup")}.to raise_error "'Won Ton Soup' is not on our menu."
    end

    it 'stores selection in basket' do
      expect{subject.select_dish("Edamame",3)}.to change{subject.basket.items.size}.by(1)
    end

  end

  describe '#place_order' do

    it 'raises an error if no items are in the basket' do
      expect{subject.place_order}.to raise_error 'You must select atleast one item before placing an order.'
    end

  end

end
