require 'takeaway'

describe Takeaway do

  let(:menu) do
    menu = []
    CSV.foreach("menu.csv") do |row|
      name, price = row
      menu << { name: name, price: price.to_i }
    end
    menu
  end
  let(:text) { double(:text, send_text: true) }
  let(:billing) { double(:billing) }
  let(:menu_instance) { double(:menu_instance, items: 'printing menu', menu: menu) }
  subject(:takeaway) { described_class.new(text, billing, menu_instance) }

  describe '#print_menu' do
    it 'prints menu' do
      expect(takeaway.print_menu).to eq 'printing menu'
    end
  end

  describe "#choose" do
    it 'adds 3 pizza to order instance variable' do
      allow(billing).to receive(:sum).and_return 24
      subject.parse_order('3 pizza')
      expect(subject.order).to include({ name: 'Pizza', price: 8, quantity: 3 })
    end
    it 'parses text correctly' do
      allow(billing).to receive(:sum).and_return 46
      subject.parse_order('3 pizza, 4 burger, 2 nuggets')
      expect(subject.order).to eq([{ total: 46 }, { name: 'Pizza', price: 8, quantity: 3 }, { name: 'Hamburger', price: 4, quantity: 4 }, { name: 'Nuggets', price: 3, quantity: 2 }])
    end
    it 'raises error when trying to choose non existent item' do
      expect { subject.parse_order('2 grapes') }.to raise_error 'Please choose something from the menu'
    end
  end

  describe '#confirm_order' do
    it 'sends text and adds order to order history' do
      allow(billing).to receive(:sum).and_return 24
      subject.parse_order('3 pizza')
      subject.confirm_order
      expect(subject.order_history).to eq [[{ :total => 24 }, { :name => "Pizza", :price => 8, :quantity => 3 }]]
    end
  end

end
