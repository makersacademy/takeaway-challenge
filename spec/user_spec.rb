require 'user'

describe User do
  
  context 'created from an array' do
 
    test_item = ['Peter Allen', '07000000000']
    let(:subject) { User.new(test_item) }

    it 'should have a name' do
      expect(subject.name).to eq test_item[0]
    end

    it 'should have a number' do
      expect(subject.number).to eq test_item[1]
    end

  end

end
