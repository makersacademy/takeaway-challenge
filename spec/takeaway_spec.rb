require 'takeaway'
describe TakeAway do
  describe '#show_menu' do
    it 'prints a list of dishes available' do
      expect(subject.show_menu).to eq("1. burger: £5\n2. fries: £3\n3. shake: £2")
    end
  end
end
