require 'menu'

describe Menu do
  describe '#list' do
    it "is a list of dishes" do
      expect(subject.list).to include( { burger: 6 } )
    end
  end
end
