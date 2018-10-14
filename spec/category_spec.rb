require 'category'

describe Category do
  let(:category_name) { 'category_name' }
  subject { described_class.new(category_name) }

  describe '#name' do
    it 'has a name' do
      expect(subject.name).to eq category_name
    end
  end
end
