require_relative '../lib/front.rb'

describe Front do

  let(:menu) {double(:menu)}
  let(:order) {double(:order)}
  let(:front) {Front.new(menu, order)}

  describe '#main_choice' do
    it "should give the user choice of;
    show memu, add to order, check order, comfirm order" do
      allow(front).to receive(:gets) {"\n"}
      text ="type: 'leave' to exit, 'menu' for the menu, 'add' to add to the order,
'show order' to show the order or 'confirm order' to confirm the order\n"
      expect{ front.main_choice }.to output(text).to_stdout
    end
    it "should exit the program on 'leave' choice" do
      allow(front).to receive(:gets) {"leave\n"}
      expect{ front.main_choice }.to raise_error(SystemExit)
    end
    it "should call menu.show_dishes on 'menu' choice" do
      allow(front).to receive(:gets) {"menu\n"}
      allow(menu).to receive(:show_dishes) {true}
      expect(front.main_choice).to eq(true)
    end
    it "should call order.show on 'show order' choice" do
      allow(front).to receive(:gets) {"show order\n"}
      allow(order).to receive(:show) {true}
      expect(front.main_choice).to eq(true)
    end
    it "should call order.confirm on 'confirm order' choice" do
      allow(front).to receive(:gets) {"confirm order\n"}
      allow(order).to receive(:confirm) {true}
      expect(front.main_choice).to eq(true)
    end
    describe 'add sub choice' do
      let(:user_input) {["add\n", "leave\n"]}
      it "should start add loop on 'add' choice" do
        allow(front).to receive(:gets).and_return(*user_input)
        allow(menu).to receive(:check).and_return(false)
        text = "enter choice in form of 'item_name, quantity', type 'leave' to leave (if no quantity is specified 1 is chosen)\n"
        expect{front.add_choice}.to output(text).to_stdout
      end
    end
  end

  describe '#add_choice' do
    it "should return with true if 'leave' entered" do
      allow(front).to receive(:gets) {"leave\n"}
      expect(front.add_choice).to eq(true)
    end
    it "should return with nil if invalid menu choice entered" do
      allow(front).to receive(:gets) {"name3\n"}
      allow(menu).to receive(:check) {false}
      expect(front.add_choice).to eq(nil)
    end
  end

end
