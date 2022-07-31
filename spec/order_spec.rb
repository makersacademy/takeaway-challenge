require 'order'

describe Order do
  let(:order) { described_class.new }
  
  describe '#add' do
    it 'adds items to order' do
      order.add("Beef Burrito", 10.00, 1)
      expect { puts order }.to output("\n#{"Your Basket of Burrito Goodness".rjust(40)}\n\n#{"Beef Burrito x 1     £10.00".rjust(40)}\n\n#{"Total:    £10.00".rjust(40)}\n").to_stdout
    end
  end

  describe '#remove' do
    it 'removes items to order' do
      order.add("Beef Burrito", 10.00, 2)
      order.remove("Beef Burrito", 1)
      expect { puts order }.to output("\n#{"Your Basket of Burrito Goodness".rjust(40)}\n\n#{"Beef Burrito x 1     £10.00".rjust(40)}\n\n#{"Total:    £10.00".rjust(40)}\n").to_stdout
    end
  end

  describe '#to_s' do
    it 'returns formatted basket with correct total' do
      order.add("Beef Burrito", 10.00, 2)
      order.add("Veggie Burrito", 8.00, 4)
      expect { puts order }.to output("\n#{"Your Basket of Burrito Goodness".rjust(40)}\n\n#{"Beef Burrito x 2     £20.00".rjust(40)}\n#{"Veggie Burrito x 4     £32.00".rjust(40)}\n\n#{"Total:    £52.00".rjust(40)}\n").to_stdout
    end
  end
end
