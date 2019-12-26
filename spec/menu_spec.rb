require 'menu'

describe Menu do
  describe "#items" do
    it 'lists dishes' do
      expect(subject.items).not_to be_empty
    end
  end
end
