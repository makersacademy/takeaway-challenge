require 'restaurant'

describe Restaurant do
  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:place_order) }
  it { is_expected.to respond_to(:on_the_menu?) }


    subject(:list) { described_class.new }

    describe '#select_items' do
      before(:context) do
        File.open("test_list.csv", "w") do |file|
          file.puts "Margherita, 6"
          file.puts "Trois fromages, 8"
        end
      end
      before(:example) { list.view_items("test_list.csv") }
      before(:example) { allow(list).to receive(:send_sms).and_return(true) }

      context 'order info is invalid' do
        context 'input is incorrectly formatted' do
          it 'throws error if comma is missing' do
            expect { list.select_items('Margherita x3 $18') }.to raise_error(RuntimeError, "Input formatted incorrectly")
          end
          it 'throws error if $ is missing' do
            expect { list.select_items('Margherita x3, 18') }.to raise_error(RuntimeError, "Input formatted incorrectly")
          end
          it 'throws error if quantity is missing' do
            expect { list.select_items('Margherita, $6') }.to raise_error(RuntimeError, "Input formatted incorrectly")
          end
        end

        it 'throws error if item is not on menu' do
          expect { list.select_items('Margarita x3, $18') }.to raise_error(RuntimeError, "Item entered that is not listed on menu")
        end
        
        it 'throws error if sum cost of order is incorrect' do
          expect { list.select_items('Margherita x3, $16') }.to raise_error(RuntimeError, "Incorrect order price entered")
        end

      end

      context 'order info is valid' do
        it 'sends a text message confirming arrival time' do
          expect(list).to receive(:send_sms)
          list.select_items('Margherita x3, Trois fromages x1, $26')
        end
      end

      after(:context) { File.delete("test_list.csv") }
      
    end
  end
end
