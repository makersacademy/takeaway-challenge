require_relative '../lib/menu.rb'

RSpec.describe Menu do
  let(:menu) { described_class.new }
  it { is_expected.to be_a Menu }
  it { is_expected.to respond_to :print_menu }

  context "#init" do
    it "has a current menu list" do
      expect(menu.current_menu).not_to be_nil
    end
    it "current menu is a Hash" do
      expect(menu.current_menu).to be_a Hash
    end
  end
  context ".print_menu" do
    it "outputs a list of dishes and their prices" do
      expect { menu.print_menu }.to output(String).to_stdout
    end
  end
end
