require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#access' do
    it "accesses the menu" do
      allow(menu).to receive(:upload) {{"dish"=>"price"}}
      expect(menu.access).to eq("dish"=>"price")
    end
  end
end