require 'menu'
describe Menu do

  describe '#list_dishes' do
    it 'responds to list_dishs' do
      expect(subject).to respond_to(:list_dishes)
    end
    it 'print the menu' do
      expect(subject.list_dishes).to output("krabby_patty: £1.25\nsalty_sea_dog: £1.25\nsailors_surprise: £3.00\ncoral_bits: £1.00\nkelp_rings: £1.50")
    end
  end

  describe '#contains?(dish)' do
    it 'responds to contains?(dish)' do
      expect(subject).to respond_to(:contains?)
    end
  end
end
