require 'order'

describe Order do

  describe '#basket' do
    it 'is initially empty' do
      expect(subject.basket).to be_empty
    end
  end

  describe '#add' do
  
    it 'can add dish to order' do
      expect { subject.add("apple juice", 3) }.to change { subject.basket.count }.by(3)
    end

    it 'raises an error if dish is not on the menu' do
      expect { subject.add("chips", 1) }.to raise_error 'Item not on menu'
    end
  end

  describe '#remove' do
    it 'can remove a dish from the order' do
      subject.add("apple juice", 1)
      expect { subject.remove("apple juice") }.to change { subject.basket.count }.by(-1)
    end

    it 'raises an error basket order is empty' do
      expect { subject.remove("chips") }.to raise_error 'Basket empty'
    end

    it 'raises an error if dish is not in basket' do
      subject.add("apple juice", 1)
      expect { subject.remove("chips") }.to raise_error 'Item not in basket'
    end
  end

  describe '#view_order' do
    it 'can show customer order so far' do
      subject.add("lemonade", 1)
      expect(subject.view_order).to include (subject.basket[0])
    end
  end






# describe '#show_menu' do
 #   it 'shows menu' do
 #     expect{subject.show_menu}.to eq(@menu.view)
 #   end
 # end
end
