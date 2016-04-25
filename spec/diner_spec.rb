require 'diner'

describe Diner do

let(:diner){described_class.new}

  context '#print_items' do
    it 'prints out the menu items' do
      expect(diner.print_items).to respond_to(:print_items)
    end
  end

end
