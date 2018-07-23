# i have included files rather than doubles here as this is inteded to run full program
# simulations. as a result, any changes to required files will affect these tests
require './lib/dish'
require './lib/menu'
require './lib/menudisplay'
require './lib/order'
require './lib/main'
describe Main do
  let(:dish)         { Dish }
  let(:menu)         { Menu.new(dish) }
  let(:order)        { Order.new(dish) }
  let(:menu_display) { MenuDisplay.new(dish, menu, order) }
  let(:subject)      { described_class.new }
  let(:def_output)   { ["---------------- Jack's Bistro ---------------",
                          "1: Durain - 4.40", "2: Durain - 4.40",
                        "---------------------Basket-------------------",
                        "Total: 0.00\n"].join("\n") 
  }
  let(:extend_output){ ["---------------- Jack's Bistro ---------------",
                        "1: Durain - 4.40", "2: Durain - 4.40",
                        "---------------------Basket-------------------",
                        "1: Durain - 4.40",
                        "Total: 4.40\n"].join("\n") 
  } 
  context 'Main methods' do
    let(:subject) { described_class.new([Dish.new('durain', 440), Dish.new('durain', 440)]) }
    describe '#menu' do
      it { expect(subject).to respond_to(:menu) }
      it { expect(subject.menu.dish_list.last).to be_a(Dish) }
      it { expect(subject.menu.dish_list.last.name).to eq('durain'.to_sym) }
      it 'can use a random menu when none is entered' do
        random_main = Main.new
        expect(random_main.menu.dish_list.length).to eq(15) # 15 is length of rand menu
      end
      
    end
    describe '#main' do
      it { expect(subject).to respond_to(:main) }
      it 'outputs correctly wwhen user quits on first command' do
        allow(subject).to receive(:gets).and_return('q')
        expect { subject.main }.to output(def_output).to_stdout
      end
      it 'can add an item to basket' do
        allow(subject).to receive(:gets).and_return('1', 'q')
        expect { subject.main }.to output("#{def_output}#{extend_output}").to_stdout
      end
      it 'can clear properly' do
        allow(subject).to receive(:gets).and_return('clear', 'q')
        expect { subject.main }.to output("#{def_output}#{def_output}").to_stdout
      end
      it 'can place order correctly' do
        allow(subject).to receive(:gets).and_return('order')
        expect { subject.main }.to output("#{def_output}Thank your for your order").to_stdout
      end
    end
  end
end
