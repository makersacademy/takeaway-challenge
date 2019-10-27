require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#view' do
    it 'displays a list of dishes and prices' do
      expect { menu.view }.to output("1. Egg fried rice: £3\n2. Sweet & sour fish: £6\n3. Morning glory: £4\n").to_stdout
    end
  end
end
