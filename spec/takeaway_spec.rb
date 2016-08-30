require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu, :dishes => {"Pilau Rice" => 2.20, "Pizza" => 5.50} }
  subject(:takeaway) { described_class.new }

  describe 'responses' do
    it { is_expected.to respond_to :menu }
    it { is_expected.to respond_to(:order).with(1).arguments }
    it { is_expected.to respond_to :total }
    it { is_expected.to respond_to :basket }
    it { is_expected.to respond_to :checkout }
  end

  describe '#menu' do
    it 'doesn\'t raise an error' do
      expect{takeaway.menu}.to_not raise_error
    end
    it 'returns the menu' do
      expect(takeaway.menu).to eq("Pilau Rice, £2.20\nEgg Fried Rice, £2.50\n")
    end

  end

  describe '#order' do
    it 'raises an error if the dish isn\'t on the menu' do
      expect{takeaway.order("A string that isn't a food")}.to raise_error("That dish isn't on the menu, please try again.")
    end
    it 'raises an error if an integer / float entered' do
      expect{takeaway.order(2)}.to raise_error("That dish isn't on the menu, please try again.")
    end
    it 'raises an error if a symbol is entered' do
      expect{takeaway.order(:Rice)}.to raise_error("That dish isn't on the menu, please try again.")
    end
  end

  describe '#basket' do

    it 'dishes are saved to the basket' do
      takeaway.order("Pilau Rice")
      takeaway.order("Pilau Rice")
      expect(takeaway.basket).to eq "2x Pilau Rice, £4.40\n"
    end

  end

  describe '#total' do

    it 'total should be called' do
      takeaway.order("Pilau Rice")
      takeaway.order("Pilau Rice")
      expect(takeaway.total).to eq "Total: £4.40"
    end

  end

  describe '#checkout' do
    it 'will reset the basket' do
      takeaway.order("Pilau Rice")
      takeaway.checkout
      expect{takeaway.basket}.to raise_error("Nothing in basket")
    end
    xit 'will send a confirmation message to user' do

    end
  end






end
