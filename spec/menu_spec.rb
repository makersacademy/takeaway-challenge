require 'menu'

describe Menu do

  it { is_expected.to respond_to :check_menu }

  it { is_expected.to respond_to(:add_to_order).with(2).arguments }

  it 'should be initialised with a default menu' do
    expect(subject.menu).to eq Menu::MENU
  end

    describe 'check' do

      it 'should print out the list of dishes and prices' do
        expect(subject.check_menu).to eq Menu::MENU
      end

    end

    describe 'add_to_order' do

      it 'should raise an error message if the dish does not match an item in the menu' do
        expect{subject.add_to_order(1, :pizza)}.to raise_error "Sorry! That's not on the menu!"
      end

      it 'should add the price of the ordered dish to a running total of costs' do
        subject.add_to_order(1, :prawn_toast)
        subject.add_to_order(2, :spring_rolls)
        expect(subject.total_cost).to eq 6.50
      end

      it 'should add the ordered item and total price for that price to the order summary' do
        subject.add_to_order(2, :prawn_toast)
        expect(subject.order_summary).to include :prawn_toast=>5.0
      end
    end

    describe 'check_order_summary' do

      xit 'should ' do
        subject.add_to_order(2, :prawn_toast)
        expect(subject.check_order_summary).to eq
      end

    end


end
