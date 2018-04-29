fdescribe Orderer do
  let(:summaries) { [ { path: ".../.", summary: "description1", category: "cat" } ]}

  let(:menu_items) { [
                    { item: "title", description: "description", price: 2.349 },
                    { item: "title2", description: "description2", price: 9.657 }
                    ] }
  let(:summary_output) {
                        "1. Cat - Description1\nPlease enter the number for the menu you want\n"
                        }
  let(:menu_output) {
                    "1. Title, £2.35 - Description\n2. Title2, £9.66 - Description2\n"
                    }

  let(:menu_handler) { instance_double "Menu_handler", file_summaries: summaries }
  let(:dishlist) { double :dishlist}
  let(:dishlist_class) { double :dishlistclass, new: dishlist}
  let(:order) { double :order }
  let(:dish) { double :dish }
  let(:order_class) { double :order_class, new: order}
  let(:order_verifier) { double :order_verifier }
  let(:order_verifier_class) {double :order_verifier, new: order_verifier}
  subject(:orderer) { described_class.new(menu_handler, dishlist_class, order_class, order_verifier_class) }


  before do
    allow(menu_handler).to receive(:get_menu_items).with(anything).and_return(menu_items)
    allow(dishlist).to receive(:dishes).and_return(menu_items)
    allow(order).to receive(:add).with(any_args)
    allow(STDIN).to receive(:gets) { '1' }
    allow(order_verifier).to receive(:process_order).with(order)
  end

  describe '#initialize' do

    it 'generates a list of menu summaries' do
      expect(menu_handler).to receive(:file_summaries)
      expect(STDIN).to receive(:gets)
      described_class.new(menu_handler, dishlist_class, order_class, order_verifier_class)
    end

    specify { expect { subject }.to output(summary_output).to_stdout }

    it 'creates a dishlist' do
      expect(subject.dishlist).to be dishlist
    end

    it 'creates an order' do
      expect(subject.order).to be order
    end

  end

  describe '#show_menu' do

    specify { expect { subject.show_menu }.to output(summary_output + menu_output).to_stdout }

  end

  describe '#add' do

    it 'adds a dish to the order' do
      item_num = 2
      expect(order).to receive(:add).with(menu_items[item_num - 1], instance_of(Integer))
      subject.add(item_num, 2)
    end

    it 'raises an error if the dish is not valid' do
      expect { subject.add(3, 2) }.to raise_error("Not a valid dish number")
    end

  end

  describe '#show_order' do

    it 'prints the order summary' do
      expect(order).to receive(:print_order)
      subject.show_order
    end
  end


  describe '#place_order' do

    it 'places the order' do
      expect(order_verifier).to receive(:process_order).with(order)
      subject.place_order
    end

  end

end
