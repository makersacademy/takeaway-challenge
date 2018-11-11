require 'menu'

describe Menu do
  before do
    allow($stdout).to receive(:write)
  end

  describe "#show_menu" do
    it "responds to show_menu" do
      expect(subject).to respond_to(:show_menu)
    end
    it "goes through the whole process of showing the menu" do
      expect_any_instance_of(Order).to receive(:order_process) { "new order created" }
      expect_any_instance_of(Menu).to receive(:gets) { "y" }
      expect(subject.show_menu).to eq("new order created")
    end
      specify { expect { subject.menu_header }.to output.to_stdout }
      specify { expect { subject.put_menu }.to output.to_stdout }
      specify { expect { subject.menu_footer }.to output.to_stdout }
    end

  describe "#menu_selection" do
    it "raises an error if not Y" do
      expect_any_instance_of(Menu).to receive(:gets) { "n" }
      expect { subject.menu_selection }.to raise_error "I think you meant to say Y"
    end

    it "creates a new instance of Order when passed y" do
      expect_any_instance_of(Order).to receive(:order_process) { "new order created" }
      expect_any_instance_of(Menu).to receive(:gets) { "y" }
      expect(subject.menu_selection).to eq("new order created")
    end
  end
end
