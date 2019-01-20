require 'menu'


describe Menu do

let(:menu) { Menu.new }

  describe "#print" do
    it 'should respond to print' do
      expect(menu).to respond_to :print
    end

    it 'formats and prints a menu item' do
      menu.items = [{item: :food_item, price: 3}]
      def sample_menu_output
        puts '1. food_item --- £3'
      end
      expect{menu.print}.to output(sample_menu_output).to_stdout
    end

  end


end
