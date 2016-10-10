require 'user'

describe User do
  describe '#initialize'
    it 'takes a mandatory name argument on initialization' do
      let(:name) { double(:name) }
      subject = subject.new(name)
      expect(subject.name).to eq name
    end
  end
end