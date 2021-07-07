require_relative '../lib/front.rb'

describe Front do

  let(:menu) { double(:menu) }
  let(:order) { double(:order) }
  let(:front) { Front.new(menu, order) }

  describe '#item_list' do
    it "creates the list of items on the menu" do
      expect(item_list).to be_an_instance_of(Array)
    end
  end

  describe '#main_choice' do
    it "should give the user choice of;
    show memu, add to order, check order, comfirm order" do
      allow(front).to receive(:gets) { "leave\n" }
      text = "type: 'leave' to exit, 'menu' for the menu, 'add' to add to the order,
'show order' to show the order or 'confirm order' to confirm the order\n"
      expect { front.main_choice }.to output(text).to_stdout
    end
    it "should exit the program on 'leave' choice" do
      allow(front).to receive(:gets) { "leave\n" }
      expect(front.main_choice).to eq('exit')
    end
    let(:user_input) { ["menu\n", "leave\n"] }
    it "should call menu.show_dishes on 'menu' choice" do
      allow(front).to receive(:gets).and_return(*user_input)
      allow(menu).to receive(:show_dishes) { true }
      expect(front.main_choice).to eq('exit')
    end
    let(:user_input1) { ["show order\n", "leave\n"] }
    it "should call order.show on 'show order' choice" do
      allow(front).to receive(:gets).and_return(*user_input1)
      allow(order).to receive(:show) { true }
      expect(front.main_choice).to eq('exit')
    end
    let(:user_input2) { ["confirm order\n", "leave\n"] }
    it "should call order.confirm on 'confirm order' choice" do
      allow(front).to receive(:gets).and_return(*user_input2)
      allow(order).to receive(:confirm) { true }
      expect(front.main_choice).to eq('exit')
    end
    describe 'add sub choice' do
      let(:user_input3) { ["add\n", "name1\n", "leave\n", "leave\n"] }
      it "should start add loop on 'add' choice" do
        allow(front).to receive(:gets).and_return(*user_input3)
        allow(menu).to receive(:check).and_return(true)
        allow(menu).to receive(:select) { ["name1"] }
        allow(order).to receive(:add) { true }
        # text = "enter choice in form of 'item_name, quantity', type 'leave' to leave (if no quantity is specified 1 is chosen)"
        expect { front.main_choice }.to output(/form of 'item_name, quantity', type 'leave' to leave/).to_stdout
      end
      let(:user_input3) { ["add\n", "name3\n", "leave\n", "leave\n"] }
      it "should start add loop on 'add' choice" do
        allow(front).to receive(:gets).and_return(*user_input3)
        allow(menu).to receive(:check).and_return(false)
        expect { front.main_choice }.to output(/Invalid menu choice/).to_stdout
      end
    end
  end

=begin
  describe '#add_choice' do
    it "should return with false if 'leave' entered" do
      allow(front).to receive(:gets) {"leave\n"}
      expect(front.add_choice).to eq(false)
    end
    it "should return with nil if invalid menu choice entered" do
      allow(front).to receive(:gets) {"name3\n"}
      allow(menu).to receive(:check) {false}
      expect(front.add_choice).to eq(nil)
    end
    it "should return with true if valid menu choice entered" do
      allow(front).to receive(:gets) {"name3\n"}
      allow(menu).to receive(:check) {true}
      allow(menu).to receive(:select) {}
      allow(order).to receive(:add) {true}
      expect(front.add_choice).to eq(true)
    end
  end
=end
end
