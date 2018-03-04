require 'user_interface'

describe UserInterface do
  subject(:user_interface) { described_class.new }

  describe '#initialize' do
    it 'injects menu class' do
      expect(user_interface.menu).to respond_to(:current_menu)
    end

    it 'injects order class' do
      expect(user_interface.order).to respond_to(:confirm_order)
    end
  end

  describe '#welcome' do
    it 'should output some text' do
      allow(user_interface).to receive(:welcome) { 'some dummy text' }
      expect(user_interface.welcome).to eq('some dummy text')
    end

    it 'should be a string' do
      expect(user_interface.welcome).to be_a(String)
    end
  end

  describe '#display_options' do
    it 'should return some options' do
      allow(user_interface).to receive(:display_options) { [1, 2, 3] }
      expect(user_interface.display_options).to eq [1, 2, 3]
    end

    it 'should return a array' do
      expect(user_interface.display_options).to be_a(Array)
    end
  end

  describe '#display_instructions' do
    it 'should return a array' do
      expect(user_interface.display_instructions).to be_a(Array)
    end
  end

  describe '#printer' do
    it 'prints the input it is given' do
      fake_text = double("Some fake text")
      expect { user_interface.printer(fake_text) }.to output.to_stdout
    end

    # is this actually doing anything?
    it 'can print an array' do
      fake_array = double(['a', 'fake', 'test'])
      expect { user_interface.printer(fake_array) }.to output.to_stdout
    end
  end

  describe '#input' do
    # how do we stop printing to rspec tests
    it 'prompts the user to input text' do
      expect { print('> ') }.to output('> ').to_stdout
    end

    it 'should return user input' do
      allow(user_interface).to receive(:gets) { '1' }
      expect(user_interface.input).to eq '1'
    end
  end

  describe '#options' do
    it 'returns a list of options' do
      #expect(user_interface.option('1')).to eq('print menu')
      expect(user_interface.option('2')).to eq('start new order')
      expect(user_interface.option('3')).to eq('view current order')
      expect(user_interface.option('4')).to eq('clear order')
      expect(user_interface.option('5')).to eq('confirm order')
    end
  end

  describe '#start_order' do
    it 'returns a populated order' do
      fake_menu_item = double("items")
      user_interface.order.add_item(fake_menu_item)
      expect(user_interface.order.current_order).not_to be_empty
    end
  end
end
