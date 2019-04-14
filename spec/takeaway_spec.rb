require 'takeaway'
describe Order do
  let(:items) { double :items }
  let(:shopping_cart) { double :shopping_cart }

  describe "#items" do
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
        expect(subject.shopping_cart).to eq [{ item: "Vegan kebab", price: 7.50 }]
      end
    end
    context "user selects second item" do
      let(:user) { ["2\n", "stop\n"] }
      it "`selects item (2)" do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.shopping_cart).to eq [{ item: "chips", price: 2.50 }]
      end
    end
    
    context "user selects third item" do
      let(:user) { ["3\n", "stop\n"] }
      it "`selects item (3)" do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.shopping_cart).to eq [{ item: "garlic sauce", price: 0.50 }]
      end
    end

    context 'user selects first and second item' do
      let(:user) { ["1\n", "2\n", "stop\n"] }
      it "`selects item (1) and (3)" do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.shopping_cart).to eq [{ item: "Vegan kebab", price: 7.50 }, { item: "chips", price: 2.50 }]
      end
    end
  end

  describe '#print_shopping_cart' do
    let(:user) { ["1\n", "3\n", "stop\n"] }
    it 'shows user items they selected in shopping cart' do
      set_user_input_and_check_expected_output
      subject.select_items
      expect { subject.print_shopping_cart }.to output(/#{"Vegan kebab: £7.50\ngarlic sauce: £0.50"}/).to_stdout
    end
  end

  describe '#order_sum' do
    it 'starts order with empty shopping cart equals £0' do
      expect(subject.order_sum).to eq 0.00
    end

    context 'user selects first item to purchase it' do
      let(:user) { ["1\n", "stop\n"] }
      it 'selects first item and shows cost' do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.order_sum).to eq 7.50
      end
    end

    context 'user selects second item to purchase it' do
      let(:user) { ["2\n", "stop\n"] }
      it 'selects second item and shows cost' do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.order_sum).to eq 2.50
      end
    end

    context 'user selects third item to purchase it' do
      let(:user) { ["3\n", "stop\n"] }
      it 'selects third item and shows cost' do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.order_sum).to eq 0.50
      end
    end

    context 'user selects first and third item to purchase it' do
      let(:user) { ["1\n", "3\n", "stop\n"] }
      it 'selects first and third item and shows cost' do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.order_sum).to eq 8.00
      end
    end

    context 'user selects first, second, and third item to purchase it' do
      let(:user) { ["1\n", "2\n", "3\n", "stop\n"] }
      it 'selects first, second, and third item and shows cost' do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.order_sum).to eq 10.50
      end
    end

    context 'user selects item multiple times' do
      let(:user) { ["1\n", "1\n", "1\n", "1\n", "1\n", "stop\n"] }
      it 'selects first, second, and third item and shows cost' do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.order_sum).to eq 37.50
      end
    end

    context 'user selects item multiple times' do
      let(:user) { ["1\n", "2\n", "1\n", "2\n", "1\n", "stop\n"] }
      it 'selects first, second, and third item and shows cost' do
        set_user_input_and_check_expected_output
        subject.select_items
        expect(subject.order_sum).to eq 27.50
      end
    end

  end

  def set_user_input_and_check_expected_output
    allow_any_instance_of(Object)
      .to receive(:gets).and_return(*user)
  end
end
