require 'takeaway_service'

describe TakeawayService do
  subject(:takeaway) { TakeawayService.new(twilio_dbl, restaurant_dbl) }
  let(:twilio_dbl) { double('twilio') }
  let(:restaurant_dbl) { double('restaurant', format_menu: formatted_menu) }
  let(:formatted_menu) { "Mock example\nof a\nformatted menu" }
  let(:order_dbl) { double('order', add: 'add confirmation', id: 1) }

  it 'sets the sms_service' do
    expect(takeaway.sms_service).to eq(twilio_dbl)
  end

  it 'sets the restaurant' do
    expect(takeaway.restaurant).to eq(restaurant_dbl)
  end

  describe '#print_menu' do
    it "sends a format_menu message to the restaurant" do
      expect(restaurant_dbl).to receive(:format_menu).once
      takeaway.print_menu
    end

    it "prints the formatted menu received from restaurant" do
      expected = "#{formatted_menu}\n"
      expect{ takeaway.print_menu }.to output(expected).to_stdout
    end
  end

  describe '#create_order(order)' do
    it 'returns the order object' do
      expect(takeaway.create_order(order_dbl)).to eq(order_dbl)
    end
  end
end
