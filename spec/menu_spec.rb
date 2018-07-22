require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe "print methods" do
    it '#print_starter_menu prints the starter menu' do
      expect { menu.print_starter_menu }.to output("Starter menu: #{menu.starters}\n").to_stdout
    end
    it '#print_main_menu prints the main menu' do
      expect { menu.print_main_menu }.to output("Main menu: #{menu.mains}\n").to_stdout
    end
    it '#print_menus prints the full menu' do
      expect { menu.print_menus }.to output("Starter menu: #{menu.starters}\nMain menu: #{menu.mains}\n").to_stdout
    end 
  end

end