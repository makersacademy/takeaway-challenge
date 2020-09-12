require 'takeaway_service'

describe TakeawayService do
  subject(:takeaway) { TakeawayService.new(restaurant_dbl) }
  let(:restaurant_dbl) { double('restaurant', format_menu: formatted_menu) }
  let(:formatted_menu) { "Mock example\nof a\nformatted menu" }

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


end
