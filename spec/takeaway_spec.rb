require 'takeaway'

describe Takeaway do
  describe '#menu' do
    it 'see a list of dishes with prices' do
      menu = subject.menu
      expect(subject.menu).to eq(menu)
    end
  end
  
  describe '#order' do
    it 'responds to method add dish to order' do
      expect(subject).to respond_to(:add).with(1).argument
    end
    it 'can select several available dishes' do
      subject.add(subject.menu.keys[0])
      subject.add(subject.menu.keys[2])
      expect(subject.order).to eq([subject.menu.keys[0], subject.menu.keys[2]])
    end
    it 'checks total received matches my order' do
      subject.add(subject.menu.keys[0])
      subject.add(subject.menu.keys[2])
      my_total = subject.menu.values[0] + subject.menu.values[2]
      expect(subject.bill).to eq(my_total)
    end
  end  

end