require "./lib/takeaway.rb"

describe Takeaway do

  describe '.list_menu' do
    it 'returns an list of menu items' do
      expect(subject.list_menu).to eq([])
    end
  end
end
