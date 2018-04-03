require 'restaurant'

describe Restaurant do

  describe 'creation' do
    let(:menu) { double :menu }
    subject { described_class.new(menu) }
    it 'Should initially create a menu' do
      expect(subject.takeaway_menu).to eq menu
    end
  end

  describe '#print_takeaway_menu' do
    let(:fakemenu) { double :fakemenu }
    it 'Should print out the takeaway menu' do
      subject { described_class.new(fakemenu) }
      expect(subject.print_takeaway_menu).to eq "These are our dishes and price: Dish Name: Vongole, Price: 14.25, Dish Name: Lasagne, Price: 12.6, Dish Name: Margherita, Price: 8.95, Dish Name: Vegetariana, Price: 12.95, Dish Name: Tiramisu, Price: 5.95, Dish Name: Prosecco, Price: 7.0"
    end

    ##below this line: trying mocking method but still trying
    # let(:menu) { double :menu }
    # let(:dish) { double :dish }
    # it '' do
    #   subject { described_class.new(menu) }
    #   allow(menu).to receive(:add_takeaway_menu).and_return(dish)
    #   expect(subject.print_takeaway_menu).to eq dish
    # end

  end

  # describe '#order' do
  #   let(:fakemenu) { double :fakemenu }
  #   let(:dish){ double :dish }
  #   it '' do
  #     subject { described_class.new(fakemenu) }
  #     allow(fakemenu).to receive(:contain?).with(dish).and_return(true)
  #     expect(subject.order(dish)).to eq "dish x 1 added to your basket:)"
  #   end
  # end

end
