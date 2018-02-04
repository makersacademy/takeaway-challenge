require "takeaway"

describe Takeaway do

  let(:menu) { {
    pizza: 10,
    bolognese: 8,
    risotto: 9,
    red_wine: 4,
    white_wine: 4.50
   } }
  let(:phone) { double "a phone", send_text: true }
  subject(:takeaway) { described_class.new(phone) }
  subject(:order) do
    takeaway.new_order(:pizza)
    takeaway.new_order(:red_wine)
    takeaway
  end
  let(:final_order) do
    puts "you have ordered: "
    puts "1 pizza"
    puts "1 red_wine"
    puts "for a total of £14."
  end

  it 'contains a menu' do
    expect(takeaway.menu).to eq menu
  end

  describe '#new_order' do
    it 'creates an order' do
      expect(takeaway.new_order(:pizza)).to eq [{ pizza: 10 }]
    end
  end

  describe '#place_order' do
    it 'returns list of dishes ordered and the total' do
      expect { order.place_order }.to output(final_order).to_stdout
    end

    it 'sends a text when successful' do

    end
  end

  describe 'current_total' do
    it "returns current price of things ordered" do
      expect(order.current_total).to eq 14
    end
  end
end
