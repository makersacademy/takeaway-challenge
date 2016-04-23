require 'menu'

describe Menu do

  it{is_expected.to respond_to(:menu)}
  it{is_expected.to respond_to(:read)}
  it{is_expected.to respond_to(:pick)}

  describe '#initialize' do
    let(:menu) {double :menu}

    it 'should create a menu containing food items and prices' do
      expect(subject.menu).to include({:king_burger => 8, :cheese_burger => 7, :chicken_burger => 7})
    end
  end

  describe '#read' do
    it 'should display the menu options' do
      expect{subject.read}.to output{@menu}.to_stdout
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

end
