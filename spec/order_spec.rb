require 'order'

describe Order do

  describe '#add_to_order' do
    it 'should allow user to select a dish' do
      menu = Menu.new
      expect(subject.add_to_order(1)[0]).to eq menu.pizzas.values[0]
    end
  end

  describe '#my_order' do
    it 'prints the trolley and total price' do
      subject.add_to_order(1)
      subject.add_to_order(2)
      subject.add_to_order(3)
      expect(subject.total_price).to eq 15
    end
  end

  describe '#view_order' do
    it 'should print order' do
      subject.add_to_order(1)
      subject.add_to_order(2)
      subject.add_to_order(3)
      message = "Your Order:\n1. Mozzarela, $4\n2. Mushrooms, $6\n3. Ham, $5\nTotal: $15\n"
      expect { subject.view_order }.to output(message).to_stdout
    end
  end

end
