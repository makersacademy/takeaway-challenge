fdescribe Orderer do
  let(:summaries) { [ { path: ".../.", summary: "description1", category: "cat" } ]}

  let(:menu_items) { [
                    { item: "title", description: "description", price: "price" },
                    { item: "title2", description: "description2", price: "price2" }
                    ] }
  let(:summary_output) { "1. Cat - Description1\nPlease enter the number for the menu you want\n"}

  let(:menu_handler) { instance_double "Menu_handler", file_summaries: summaries }
  let(:dishlist) { double :dishlist}
  let(:dishlist_class) { double :dishlistclass, new: dishlist}
  let(:order) { double :order }
  let(:order_class) { double :order_class, new: order}
  subject(:orderer) { described_class.new(menu_handler, dishlist_class, order_class) }

  before do
    allow(menu_handler).to receive(:get_menu_items).with(anything).and_return(menu_items)
    allow(dishlist).to receive(:dishes).and_return(menu_items)
    allow(order).to receive(:add).with(any_args)
  end

  describe '#initialize' do
    before { allow(STDIN).to receive(:gets) { '1' } }
    it 'generates a list of menu summaries' do
      expect(menu_handler).to receive(:file_summaries)
      expect(STDIN).to receive(:gets)
      described_class.new(menu_handler)
    end

    specify { expect { described_class.new(menu_handler) }.to output(summary_output).to_stdout }

    it 'creates a dishlist' do

    end

    it 'creates an order' do
    end

  end



  describe '#place_order' do

  end


end
