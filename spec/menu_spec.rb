require 'menu'

describe Menu do
  let(:double_items) { { "item one" => 0.99, "item two" => 1.99 } }
  let(:double_menu_display) { 
    "TAKEAWAY MENU\n" +
    "=" * 39 + "\n" +
    "1. " + "Item One".ljust(30, '.') + " £0.99\n" +
    "2. " + "Item Two".ljust(30, '.') + " £1.99\n" +
    "=" * 39 + "\n"
  }

  describe '#show_menu' do
    it { is_expected.to respond_to(:show_menu) }
    
    it 'displays menu' do
      allow(subject).to receive(:items).and_return(double_items)
      expect { subject.show_menu }.to output(double_menu_display).to_stdout
    end
  end
end
