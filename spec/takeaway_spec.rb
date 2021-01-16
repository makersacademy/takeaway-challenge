require 'takeaway'

describe Takeaway do 
  context '#menu' do
    it '#see_menu should return the menu' do 
      expect(subject.see_menu).to eq subject.menu
    end

    it 'should be an array' do 
      expect(subject.menu).to be_a Array
    end

    it 'should include hashes' do 
      expect(subject.menu).to include Hash
    end

    it 'should have individual dishes as hashes' do 
      expect(subject.menu[-2]).to be_a Hash
    end

  end
  context'#add_to_order' do 
    it 'should add dish to order' do
      subject.add_to_order("Cheeseburger",1)
      expect(subject.basket).to eq [{dish: "Cheeseburger", quantity: 1}]
    end
    it 'should raise error if dish not on menu' do 
      expect { subject.add_to_order("Spag Bog",1) }.to raise_error "Dish not on menu"
    end
  end
end
