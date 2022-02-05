require 'menu'

describe Menu do

  describe '#view_menu' do
    it 'should show the items on the menu' do
      allow(subject).to receive(:view_menu) { "1. noodles, 9"}
      expect(subject.view_menu).to eq "1. noodles, 9"
    end
  end

  describe '#select_dish' do
    it 'should allow selection of a specific dish' do
      allow(subject).to receive(:gets).and_return("1\n")
      expect(subject.select_dish).to eq "1. noodles, 9"
    end
  end

  describe '#place_order' do
    it 'should pass selected dish to an order' do
      allow(subject).to receive(:gets).and_return("1\n")
      subject.select_dish
      expect(subject.place_order).to be_an(Order)
    end
  end

  describe '#select_quantity' do
    it 'should allow selection of a quantity' do
        allow_any_instance_of(Menu).to receive(:gets).and_return("1\n")
        expect(subject.select_quantity).to eq 1
    end
  end

end
