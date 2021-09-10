require "menu"
describe Menu do

  it "is expected to list menu items with prices" do
    menu = Menu.new
    allow(menu). to receive(:printed_menu).and_return(:printed_menu)
    # expect { menu.printed_menu }.to output(@menu).to_stdout
    # expect(menu.prints).to be printed_menu
  end
end
