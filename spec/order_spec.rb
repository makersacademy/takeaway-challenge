describe Order do
  let(:pasta) { instance_double Dish, name: 'Pasta', price: 5 }
  let(:bolognese) { instance_double Dish, name: 'Bolognese', price: 5 }
  let(:salad) { instance_double Dish, name: 'Salad', price: 2 }
  let(:not_on_menu) { instance_double Dish, name: 'Not on menu', price: 1 }
  let(:menu) { instance_double Menu, dishes: [pasta, bolognese, salad] }
  let(:message_class) { double :message_class, new: message }
  let(:message) { instance_double Message, send: nil }
  subject { described_class.new(menu) }

  describe '#initialize' do
    it 'is expected to initialize with one argument' do
      expect(described_class).to respond_to(:new).with(1).argument
    end
  end

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

    it 'should add multiple dishes' do
      subject.add(pasta, 2)
      subject.add(bolognese, 1)
      subject.add(bolognese, 1)
      subject.add(salad, 1)
      items = [
        { dish: pasta, amount: 2 },
        { dish: bolognese, amount: 2 },
        { dish: salad, amount: 1 }
      ]
      expect(subject.items).to eq items
    end
  end

  describe '#list' do
    it 'should throw error for empty order' do
      expect { subject.list }.to raise_error 'The order is empty'
    end

    it 'should list the items on the order' do
      subject.add(pasta, 2)
      subject.add(bolognese, 2)
      subject.add(salad, 1)
      order_list = "2 x Pasta\n2 x Bolognese\n1 x Salad\n"
      expect { subject.list }.to output(order_list).to_stdout
    end
  end

  describe '#total' do
    it 'should throw error for empty order' do
      expect { subject.total }.to raise_error 'The order is empty'
    end

    it 'should return the total cost for a full order' do
      subject.add(pasta, 2)
      subject.add(bolognese, 2)
      subject.add(salad, 1)
      expect(subject.total).to eq 22
    end
  end

  describe '#confirm' do
    it 'should throw error for empty order' do
      expect { subject.confirm }.to raise_error 'The order is empty'
    end

    it 'should return a message for a full order' do
      time = Time.new
      text = "Thank you! Your order was placed and will be delivered before #{(time.hour + 1) % 24}:#{time.min}\n"
      subject.add(pasta, 2)
      subject.add(bolognese, 2)
      subject.add(salad, 1)
      expect { subject.confirm(message_class) }.to output(text).to_stdout
    end

    it 'should send a text message' do
      subject.add(pasta, 2)
      subject.add(bolognese, 2)
      subject.add(salad, 1)
      subject.confirm(message_class)
    end
  end
end

# +447533006429
