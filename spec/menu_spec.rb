require 'menu'

describe Menu do
  subject(:menu) {described_class.new}


  describe '#print' do
    it { is_expected.to respond_to(:print)}
    it "prints menu" do
      expect(menu.print).to eq(menu.menu_list.each {|d,p| "#{d} : £#{p}"})
    end
  end
  describe "#choose" do
    it "adds a dish to the order" do
      menu.choose("cheese and tomato")
      expect(menu.order).to eq [{"cheese and tomato" => 5.99}]
    end
  end
  describe "#check" do
    it "checks order" do
      menu.choose("cheese and tomato")
      menu.choose("pepperoni")
      expect(menu.check).to eq [{"cheese and tomato" => 5.99}, {"pepperoni" => 7.99}]
    end
  end
end
