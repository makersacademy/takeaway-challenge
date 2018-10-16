require 'menu'

describe Menu do
  describe '#list' do
    it 'responds to list' do
      expect(subject).to respond_to :list
    end
    it 'prints the list of products' do
      expect { subject.list }.to output("1. Fish £1\n2. Chicken nuggets £2\n3. Roast Chicken £5\n4. Chicken Burger £2\n5. BBQ Chicken £3\n6. Fried Chicken £1\n").to_stdout
    end
  end
end
