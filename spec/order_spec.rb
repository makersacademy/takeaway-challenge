require 'order'

describe Order do
  let(:the_menu) {double :the_menu}
  let(:choice) {double :choice}
  describe '#make_order' do
    it 'Should make a order' do
      expect(subject.current_order).to_not eq nil
    end
  end
  describe '#load_menu' do
    it 'Should load menu' do
      expect{subject.load_menu(the_menu)}.to change{subject.menu}.from(nil).to(the_menu)
    end
  end

  describe '#make_order' do
    it 'Should let user pick from the menu' do
      subject.load_menu(the_menu)
      subject.make_order(choice)
      expect(subject.current_order).to_not eq nil
      # my_choice = subject.make_order(choice)
      # expect(subject.menu).to include(my_choice)
    end
  end
end
