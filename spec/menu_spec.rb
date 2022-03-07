require 'menu'

describe Menu do
  let(:dish) { double(:dish, name: 'paneer_tikka_masala', price: 10) }
  let(:second_dish) { double(:second_dish, name: 'pizza', price: 20) }

  before do
    subject.menu = []
  end

  it 'can respond to add dish' do
    expect(subject).to respond_to(:add_dish)
  end

  it 'can add a named dish to the menu' do
    allow(Dish).to receive(:new).and_return(dish)
    subject.add_dish('paneer_tikka_masala', 10)
    expect(subject.menu).to eq([dish])
  end

  it 'can remove a specific dish from the menu' do
    allow(Dish).to receive(:new).and_return(dish)
    subject.add_dish('paneer_tikka_masala', 10)
    allow(Dish).to receive(:new).and_return(second_dish)
    subject.add_dish('pizza', 20)
    expect { subject.remove_dish('paneer_tikka_masala') }.to change { subject.menu }.from([dish, second_dish]).to([second_dish])
  end

  it 'adds a main to the mains array and prints the name and price of the dish' do
    allow(Dish).to receive(:new).and_return(dish)
    subject.add_dish('paneer_tikka_masala', 10)
    expect { subject.print_menu }.to output("paneer_tikka_masala - £10\n").to_stdout
  end

end