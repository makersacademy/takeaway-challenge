require 'menu'

describe Menu do
  SET_MENU = 3

  it { expect(subject).to respond_to :menu_generator }
  it { expect(subject).to respond_to :print_menu }
  let(:pizza_dish) { double :dish }
  let(:paste_dish) { double :dish }
  let(:side_dish) { double :dish }
  let(:salade_dish) { double :dish }
  context 'when generate a mune' do
    before {
      allow(pizza_dish).to receive(:name).and_return('Paste with shrimps')
      allow(pizza_dish).to receive(:price).and_return(10.00)
      allow(paste_dish).to receive(:name).and_return('Paste with octopus')
      allow(paste_dish).to receive(:price).and_return(7.90)
      allow(side_dish).to receive(:name).and_return('Rise')
      allow(side_dish).to receive(:price).and_return(3.50)
      allow(salade_dish).to receive(:name).and_return('Mix')
      allow(salade_dish).to receive(:price).and_return(5.30)

    }

    it 'generate menu' do
      allow(Dish).to receive(:rand_pizza_dish).and_return(pizza_dish)
      allow(Dish).to receive(:rand_paste_dish).and_return(paste_dish)
      allow(Dish).to receive(:rand_side_dish).and_return(side_dish)
      allow(Dish).to receive(:rand_salade_dish).and_return(salade_dish)
    end

  end
end
