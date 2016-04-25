require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:menu_content) { "Pollo £10.00" }
  before { allow(File).to receive(:open) { menu_content } }

  describe "#initialize" do
    it 'opens a file and puts its contents into a menu' do
      expect(menu.items).to eq [{dish: "Pollo", price: "10.00"}]
    end
  end

  describe "#display" do
    it 'displays the menu on the screen' do
      spacing = Menu::LINEWIDTH
      line1 = ("-"*spacing) + "\n"
      line2 = "MENU\n\n"
      line3 = "Item".ljust(spacing/2) + "Price".rjust(spacing/2) + "\n"
      line4 = "----".ljust(spacing/2) + "-----".rjust(spacing/2) + "\n"
      line5 = "\nPollo".ljust(spacing/2)+(("£10.00").rjust((spacing+2)/2))
      line6 = "\n" + ("-"*spacing) + "\n"
      message = line1 + line2 + line3 + line4 + line5 + line6
      expect { menu.display }. to output(message).to_stdout
    end
  end
end
