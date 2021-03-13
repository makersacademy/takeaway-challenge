require 'restaurant'

describe Restaurant do
  describe '#list_dishes' do
    it 'responds to restaurant' do
      expect(subject).to respond_to :list_dishes
    end
    it 'returns a hash of dishes' do
      expect { subject.list_dishes }.to output.to_stdout
    end
  end

end
