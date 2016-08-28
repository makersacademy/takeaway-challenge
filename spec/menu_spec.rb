require 'menu'

describe Menu do

subject(:menu) { described_class.new }

#let(:meals) {{ sprouts: 3.50, brocolli: 2.99 }}


  describe '#print_menu' do
    it "it prints a list of meals with prices" do
      expect(menu.print_menu).to respond_to :map
    end
  end



end
