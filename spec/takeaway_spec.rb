require 'takeaway'
describe Order do
  let(:items) { double:items }
  let(:shopping_cart) { double:shopping_cart }
  describe "#items" do
    items = [{ food1: 3 }, { food2: 5 }, { food3: 7 }]
    it 'has items' do
      expect(subject).to respond_to :items
    end
  end

  describe '#select_items' do
    context "user selects first item" do
      let(:user) { ["1\n", "stop\n"] }
      it "`selects item (1)" do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.shopping_cart).to eq [{ item: "Vegan kebab", price: "£7.50" }]
      end
    end
    context "user selects second item" do
      let(:user) { ["2\n", "stop\n"] }
      it "`selects item (2)" do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.shopping_cart).to eq [{ item: "chips", price: "2.50" }]
      end
    end
    
    context "user selects third item" do
      let(:user) { ["3\n", "stop\n"] }
      it "`selects item (3)" do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.shopping_cart).to eq [{ item: "garlic sauce", price: "£0.50" }]
      end
    end
  end

  def set_user_input_and_check_expected_output
    allow_any_instance_of(Object)
      .to receive(:gets).and_return(*user)
  end
end
