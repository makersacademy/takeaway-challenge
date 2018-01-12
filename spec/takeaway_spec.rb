require 'takeaway'

describe Takeaway do

  let(:menu_class) { double(:menu_class, new: menu) }

  describe '#initialize' do
    it 'should be an instance of Takeaway class' do
      expect(subject).to be_an_instance_of(Takeaway)
    end
  end

  describe '#print_menu' do
    it 'prints the menu' do
      allow(subject).to receive(:print_menu).and_return(@menu)
    end
  end

  describe '#order' do
    it 'puts the chosen food into the basket' do
      expect{subject.order('Pepperoni')}.to change{subject.basket.count}.by(1)
    end

  end


end
