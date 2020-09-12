require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(restaurant_dbl) }
  let(:restaurant_dbl) { double('restaurant', menu: menu_dbl) }
  let(:menu_dbl) { double('menu', dishes: [dish_dbl1, dish_dbl2, dish_dbl3]) }
  let(:formatted_menu) { "Mock example\nof a\nformatted menu" }
  let(:dish_dbl1) { double('dish', name: 'Pepperoni pizza', price: 8.99) }
  let(:dish_dbl2) { double('dish', name: 'Lasagne', price: 10.00) }
  let(:dish_dbl3) { double('dish', name: 'Tiramisu', price: 5.20) }

  it 'sets the restaurant' do
    expect(takeaway.restaurant).to eq(restaurant_dbl)
  end

  describe '#print_menu' do
    it "prints the restaurant's formatted menu" do
      allow(menu_dbl).to receive(:format).and_return(formatted_menu)
      expected = "#{formatted_menu}\n"
      expect{ takeaway.print_menu }.to output(expected).to_stdout
    end
  end


end
