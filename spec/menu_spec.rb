require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe '#view' do
    it "checks the user can see a list of dishes with prices" do
      expect(STDOUT).to receive(:puts).and_return(menu.choices)
      menu.view
    end
  end
end
