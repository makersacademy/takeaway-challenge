require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

   
  describe '#print' do
    it { is_expected.to respond_to(:print)}
    it "prints menu" do
      expect(menu.print).to eq(menu.menu_list.each {|d,p|puts "#{d} : £#{p}"})
    end
  end
  describe "#add_dish" do
    it "adds a dish to the order" do
      expect(menu.choose)
    end
  end
end
