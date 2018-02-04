require 'take_away'

describe TakeAway do

  subject(:take_away) { described_class.new }

  describe '#home_options' do
    it 'outputs choices to user' do
      options = "\nSelect an Option:\nType 'Menu' to View Menu\nType 'Order' to Place Order\nType 'Exit' to Leave\n"
      expect { take_away.home_options }.to output(options).to_stdout
    end
  end

  describe '#create_order' do

    it 'creates a new instance of Order' do
      expect(take_away.create_order).to be_instance_of(Order)
    end
  end

  describe '#remove_item' do
    it 'asks user what they want to remove' do
      question = "What would you like to remove from your basket?"
      expect { take_away.remove_item }.to output(question).to_stdout
    end
  end

end
