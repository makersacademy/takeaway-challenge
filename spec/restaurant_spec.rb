require 'restaurant'

describe Restaurant do
  before(:context) do
    File.open("test_list.csv", "w") { |file| file.puts "Margherita, 6"; file.puts "Trois fromages, 8" }
  end
  subject(:restaurant) { described_class.new("test_list.csv") }

  it { is_expected.to respond_to(:view_menu) }

  describe '#view_menu' do
    it 'prints from menu' do
      expect(restaurant).to receive(:print_from_menu)
      restaurant.view_menu
    end
  end

  describe '#make_order' do
    before(:example) { allow(restaurant).to receive(:send_sms).and_return(true) }

    context 'order info is invalid' do
      context 'input is incorrectly formatted' do
        it 'throws error if comma is missing' do
          expect { restaurant.make_order('Margherita x3 $18') }.to raise_error(RuntimeError, "Input formatted incorrectly")
        end
        it 'throws error if $ is missing' do
          expect { restaurant.make_order('Margherita x3, 18') }.to raise_error(RuntimeError, "Input formatted incorrectly")
        end
        it 'throws error if quantity is missing' do
          expect { restaurant.make_order('Margherita, $6') }.to raise_error(RuntimeError, "Input formatted incorrectly")
        end
      end

      it 'throws error if item is not on menu' do
        expect { restaurant.make_order('Margarita x3, $18') }.to raise_error(RuntimeError, "Item entered that is not listed on menu")
      end
      
      it 'throws error if sum cost of order is incorrect' do
        expect { restaurant.make_order('Margherita x3, $16') }.to raise_error(RuntimeError, "Incorrect order price entered")
      end

    end

    context 'order info is valid' do
      it 'sends a text message confirming arrival time' do
        expect(restaurant).to receive(:confirm_delivery)
        restaurant.make_order('Margherita x3, Trois fromages x1, $26')
      end
    end

    after(:context) { File.delete("test_list.csv") }
    
  end
end
