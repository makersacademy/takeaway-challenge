require 'menu'

describe Menu do

  describe '#viewmenu' do
    it 'displays the menu' do
      expect { subject.viewmenu }.to output.to_stdout
    end
  end

  describe '#order' do
    it 'adds an item to the basket' do
      expect { subject.order(1, 2) }.to change { subject.basket }.to([{"tuna soaked nut butter": 2.00}])
    end

    it 'adds an item to the basket a specified amount of times' do
      pending
      expect { subject.order(1, 3) }.to change { subject.basket }.to([{"tuna soaked nut butter": 2.00}, {"tuna soaked nut butter": 2.00}, {"tuna soaked nut butter": 2.00}])
    end

    it 'provides a success message' do
      expect(subject.order(1,2)).to eq("You added tuna soaked nut butter 2 time(s)!")
    end
  end

end
