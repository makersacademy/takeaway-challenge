require 'menu'
describe Menu do 
  it 'creates a dishes array' do 
    expect(subject.dishes).to eq [
    	{ item: 'Bruschetta', price: 6 }, 
    	{ item: 'Garlic Bread', price: 2 }, 
      { item: 'Linguini', price: 6 },
      { item: 'Pizza', price: 4 },
      { item: 'Risotto', price: 5 }, 
      { item: 'Spaghetti', price: 5 }, 
      { item: 'Tiramisu', price: 7 }
      ] 
  end
  
  describe '#list' do 
    it 'tests list method' do 
      expect(subject).to respond_to(:list)
    end
    it 'output first dish on menu' do 
      expect { subject.list }.to output("1. Bruschetta £6\n2. Garlic Bread £2\n3. Linguini £6\n4. Pizza £4\n5. Risotto £5\n6. Spaghetti £5\n7. Tiramisu £7\n").to_stdout
    end
  end
  
  describe '#order' do 
    it 'test order method' do 
      expect(subject).to respond_to(:order).with(1).arguments
    end
    
    it 'orders 3 menu items' do 
      subject.order([2, 4, 6])
      expect(subject.order_dishes).to eq [2, 4, 6]
    end
    
    it 'order returns a message' do
      expect(subject.order([2, 4, 6])).to eq 'Thank you! Your order was placed.'
    end
  end
  
end
