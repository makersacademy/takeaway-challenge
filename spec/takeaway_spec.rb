require 'takeaway'

  describe Takeaway do

  subject(:takeaway) { described_class.new(menu_klass)}
  let (:menu_klass) { double :menu_klass, new: nil, show: nil, meals: {'Bombay Aloo': 5, 'Lamb Passanda': 9}}
  let (:dish) { double :dish}
  let (:number) { double 999}
  let (:wrong_dish) {double :wrong_dish}

  describe '#choose' do
    it 'should let customer choose several items' do
      subject.place_order(2, 'Bombay Aloo')
      subject.place_order(2, 'Lamb Passanda')
      expect(subject.place_order).to eq [[2, 'Bombay Aloo'], [2, 'Lamb Passanda']]
    end

    it 'should raise error if item not on menu' do
      expect{subject.place_order(2, 'Sushi')}.to raise_error 'Not on menu'
    end
  end


end
