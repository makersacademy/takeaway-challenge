require 'menu'


describe Menu do
  order = "order"
  menu = Menu.new(order)
  before do
    allow($stdout).to receive(:write)

  end
  describe "#puts the menu" do
    it "responds to show_menu" do
      expect(menu).to respond_to(:show_menu)
    end
      specify { expect { menu.menu_header }.to output.to_stdout }
      specify { expect { menu.put_menu }.to output.to_stdout }
      specify { expect { menu.menu_footer }.to output.to_stdout }
    end
  describe "#menu_selection" do

    it "raises an error if not Y" do
      expect_any_instance_of(Menu).to receive(:gets) { "n" }
      expect { menu.menu_selection }.to raise_error "I think you meant to say Y"
    end

    it "creates a new instance of Order when passed y" do
      expect_any_instance_of(Order).to receive(:order_process) { "new order created" }
      expect_any_instance_of(Menu).to receive(:gets) { "y" }
      expect(subject.menu_selection).to eq("new order created")
    end
  end
end
