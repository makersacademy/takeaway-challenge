require 'dishes'

describe Dish do
  subject(:menu) { described_class.new }

  describe 'show a list of dishes with prices' do
    it 'shows a list of menu items and prices' do
      menu.show_list
      expect { menu.show_list }.to output.to_stdout
    end


  end

end
