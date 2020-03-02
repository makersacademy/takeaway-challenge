require 'order'
describe Takeaway do
  let(:dishes) {{'Pizza' => 10, 'Pasta' => 9, 'Burger' =>  8}}
  describe '#show_dishes' do
    it { expect(subject).to respond_to :show_dishes }
    it 'returns array containing dish and price' do
      subject.instance_variable_set(:@dishes, dishes)
      expect { subject.show_dishes }.to output("Pizza - £10\nPasta - £9\nBurger - £8\n").to_stdout
    end
  end
end

describe Order do
  let(:dishes) {{'Pizza' => 10, 'Pasta' => 9, 'Burger' =>  8}}
  describe '#order.add' do
    it { expect(subject).to respond_to(:add).with(2).arguments }
    it 'add one dish to order' do
      subject.instance_variable_set(:@dishes, dishes)
      subject.add('Pizza',1)
      expect(subject.order).to match_array([['Pizza', 10]])
    end
    it 'adds chosen dishes and quantity to array' do
      subject.instance_variable_set(:@dishes, dishes)
      subject.add('Pizza',2)
      subject.add('Pasta',1)
      expect(subject.order).to eq([['Pizza', 10],['Pizza', 10],['Pasta', 9]])
    end
  end
  describe '#show_order' do
    it { expect(subject).to respond_to(:show_order) }
    it 'list single dish order' do
      subject.instance_variable_set(:@dishes, dishes)
      subject.add('Pizza',1)
      expect{subject.show_order}.to output("Pizza - £10\n\nTotal = £10\n").to_stdout
    end
    it 'list multiple dish order' do
      subject.instance_variable_set(:@dishes, dishes)
      subject.add('Pizza',2)
      subject.add('Pasta',1)
      expect{subject.show_order}.to output("Pizza - £10\nPizza - £10\nPasta - £9\n\nTotal = £29\n").to_stdout
    end
  end
  describe '#checkout' do
    it { expect(subject).to respond_to(:checkout) }
  end
end

# take a look at the before hook
