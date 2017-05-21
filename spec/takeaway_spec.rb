require './lib/takeaway'
require './lib/menu'

describe Takeaway do

subject(:takeaway) { described_class.new }
let(:order) { instance_double("Order") }

  context '#view_menu' do
    it 'prints menu to stdout' do
      expect{takeaway.view_menu}.to output.to_stdout
    end
  end

  context '#place_order' do
    context '#prompt' do
      it 'prompts user to input order' do
        expect{takeaway.place_order}.to output.to_stdout
      end
    end

    context '#orderloop' do
      it 'loops over order input method while input != nil' do
      end
    end

    context '#print_order' do
      it 'prints order for review once finished' do
        expect{takeaway.confirm_order}.to output{takeaway.order}.to_stdout
      end
    end

    context '#confirm_order' do
      it 'allows user to confirm order' do
        expect{takeaway.confirm_order}.to output{"Confirmed."}.to_stdout
      end
      it 'allows user to cancel order' do
        expect{takeaway.confirm_order}.to output{"Cancelled."}.to_stdout
      end
    end

  end

end
