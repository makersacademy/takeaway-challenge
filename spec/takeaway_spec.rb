require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new }
  describe '#see_menu' do
    it "prints list of menu" do
      expect{ menu.see_menu }.to output.to_stdout
    end
  end
end
