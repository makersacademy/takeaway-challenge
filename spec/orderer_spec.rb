describe Orderer do
  let(:summaries) { [ { path: ".../.", summary: "description1", category: "cat" } ]}

  let(:menu_items) { [
                    { item: "title", description: "description", price: "price" },
                    { item: "title2", description: "description2", price: "price2" }
                    ] }
  let(:summary_output) { "1. Cat - Description1\n"}

  let(:menu_handler) { instance_double "Menu_handler", file_summaries: summaries }

  subject(:orderer) { described_class.new(menu_handler) }

  before { allow(menu_handler).to receive(:get_menu_items).with(anything).and_return(menu_items) }

  describe '#initialize' do

    it 'generates a list of menu summaries' do
      expect(menu_handler).to receive(:file_summaries)
      described_class.new(menu_handler)
    end

    specify { expect { described_class.new(menu_handler) }.to output(summary_output).to_stdout }

  end

  describe '#'


end
