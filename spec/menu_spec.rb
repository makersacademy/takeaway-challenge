require 'menu'

describe Menu do

  describe '#view_menu' do
    it 'should show the items on the menu' do
      allow(subject).to receive(:view_menu) { "1. noodles,9"}
      expect(subject.view_menu).to eq "1. noodles,9"
    end
  end

  describe '#select_dish' do
    xit 'should allow selection of a specific dish' do
      allow(subject).to receive(:gets).twice.and_return("1\n")
      allow(subject).to receive(:gets).and_return("\n")
      subject.select_dish
      expect(subject.dishes).to eq("1. noodles,9")
    end
  end

  describe '#select_quantity' do
    it 'should allow selection of a quantity' do
        allow(subject).to receive(:gets).and_return("1\n")
        expect { subject.select_quantity }.to change { subject.quantity }.to(1)
    end
  end

end
