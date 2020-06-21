require 'takeaway'

describe Takeaway do
  describe '#see_menu' do
  let (:menu) { double(:menu, list: {Potato: 1, Hummus: 2}) }
    it 'should display a list of dishes and prices' do
      ta = Takeaway.new(menu)
      actual = ta.see_menu
      expect(actual).to eq "Potato: £1\nHummus: £2\n"
    end
  end

end