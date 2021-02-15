require 'menu'

describe Menu do

    it 'should be an Array of dishes with prices' do
      expect(subject.items).to be_an(Array)
    end

end
