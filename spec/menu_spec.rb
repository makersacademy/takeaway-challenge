require 'menu.rb'

describe Menu do
  describe '#list' do
    it 'responds to list' do
      expect(subject).to respond_to :list
    end
    it 'prints the list of products' do
      expect { subject.list }.to output("1. Fish £1\n2. Chicken £2\n").to_stdout
    end
  end
end
