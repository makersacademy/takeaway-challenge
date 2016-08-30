require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:item) { :chicken }
  let(:cost) { 3.99 }

  describe '#add' do
    it "adds an item to the menu" do
      menu.add(item, cost)
      expect(menu.all.fetch(item)).to eq(cost)
    end
  end

  describe '#all' do
    it "lists all items in the menu" do  
      menu.add(item, cost)
      menu.add(item, cost)
      menu.add(item, cost)
      menu.add(item, cost)
      expect(menu.all).to eq({item => cost,item => cost,item => cost,item => cost})
    end
  end
end
