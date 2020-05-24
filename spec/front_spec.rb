require_relative '../lib/front.rb'

describe Front do

  let(:menu) {double(:menu)}
  let(:order) {double(:order)}
  let(:front) {Front.new(menu, order)}

  describe '#main_choice' do
    it "should give the user choice of;
    show memu, add to order, check order, comfirm order" do
      allow(front).to receive(:gets) {"\n"}
      text ="type: 'menu' for the menu, 'add' to add to the order,
'show order' to show the order or 'confirm order' to confirm the order\n"
      expect{ front.main_choice }.to output(text).to_stdout
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
      it "should start add loop on 'add' choice" do
        allow(front).to receive(:gets) {["add\n", "name1\n"]}
        text = "enter choice in form of 'item_name, quantity' (if no quantity is specified 1 is chosen)\n"
        expect{front.add_choice}.to output(text).to_stdout
      end
    end
  end
end
