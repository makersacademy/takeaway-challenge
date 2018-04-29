describe Order do
  let(:pasta) { instance_double Dish, name: 'Pasta', price: 5 }
  let(:bolognese) { instance_double Dish, name: 'Bolognese', price: 5 }
  let(:salad) { instance_double Dish, name: 'Salad', price: 2 }
  let(:not_on_menu) { instance_double Dish, name: 'Not on menu', price: 1 }
  let(:menu) { instance_double Menu, dishes: [pasta, bolognese, salad] }
  subject { described_class.new(menu) }

  describe '#initialize' do
    it 'is expected to initialize with one argument' do
      expect(described_class).to respond_to(:new).with(1).argument
    end
  end

  it { is_expected.to respond_to(:add).with(2).argument }

  describe '#add' do
    it 'should not add dishes that do not exist' do
      expect { subject.add(not_on_menu) }.to raise_error 'Not on menu'
    end

    it 'should default add one dish if no amount is given' do
      subject.add(pasta)
      expect(subject.items).to eq [{ dish: pasta, amount: 1 }]
    end

    it 'should add two dishes if two specified' do
      subject.add(pasta, 2)
      expect(subject.items).to eq [{ dish: pasta, amount: 2 }]
    end

    it 'should stack dishes' do
      subject.add(pasta)
      subject.add(pasta)
      expect(subject.items).to eq [{ dish: pasta, amount: 2 }]
    end
  end
end
