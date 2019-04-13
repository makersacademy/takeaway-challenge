require 'menu'

describe Menu do
  describe '#list' do
    it "is a list of dishes" do
      expect(subject.list.count).to be > 0
    end
  end
end
