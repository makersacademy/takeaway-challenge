require 'takeaway'

describe Takeaway do
  describe '#menu' do
    it 'shows the customer a menu' do
      expect { subject.menu }.to output.to_stdout
    end
  end

  describe '#order' do
    it 'adds items to the basket' do
      subject.order(1, 2)
      subject.order(3, 4)
      expect { subject.basket }.to output("2 x  Beef Burrito - £20.00\n4 x  Veggie Burrito - £32.00\n").to_stdout
    end  
  end

  describe '#basket' do
    it 'displays the items contained' do
      subject.order(1, 2)
      subject.order(3, 4)
      expect { subject.basket }.to output("2 x  Beef Burrito - £20.00\n4 x  Veggie Burrito - £32.00\n").to_stdout
    end  
  end
end

