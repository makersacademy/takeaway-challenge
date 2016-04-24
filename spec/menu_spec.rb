require 'menu'

describe Menu do

  it{is_expected.to respond_to(:menu)}
  it{is_expected.to respond_to(:read)}
  it{is_expected.to respond_to(:pick)}
  it{is_expected.to respond_to(:price)}

  let(:menu) {double :menu}
  let(:menu_item) {double :menu_item}

  describe '#initialize' do

    it 'should create a menu containing food items and prices' do
      expect(subject.menu).to be_a(Hash)
    end
  end

  describe '#read' do
    it 'should display the menu options' do
      expect{subject.read}.to output{menu}.to_stdout
    end
  end

  describe '#pick' do
    it 'should return an item from the list of menu options' do
      expect(subject.pick(:cheese_burger)).to eq({:cheese_burger => 7})
    end
    it 'should raise an error if the item is not on the menu' do
      expect{subject.pick(:avocado)}.to raise_error("Sorry, that item is not on the menu")
    end
  end

  describe '#price' do
    it 'should dsiplay the dish\'s price' do
      expect(subject.price(:king_burger)).to eq(8)
    end
  end

end
