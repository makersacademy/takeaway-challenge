require 'takeaway'
require 'menu'

describe Takeaway do
  let(:fake_menu) { { burger: 3, cheeseburger: 4, chips: 2 } }
  let(:menu) { Menu.new }
  let(:subject) { Takeaway.new(menu) }
  it 'responds to print_menu' do
    expect(subject.menu).to respond_to(:print_menu)
  end

  it 'prints the menu from Menu class' do
    expect(subject.print_menu).to eq fake_menu
  end

  it 'responds to add_item' do
    expect(subject).to respond_to(:add_item).with(2).arguments
  end

  context '#add_item' do
    order_1 = "2 x burger, item total = £6\n"

    it 'allows the user to add an item' do
      expect { subject.add_item "burger", 1 }.to change { subject.basket.length }.by 1
    end

    it 'allows the user to add several of one item' do
      expect { subject.add_item "burger", 2 }.to change { subject.basket.length }.by 2
    end
    #   let's come back to this one... SO close and funcitonally it does work!
    it 'returns the item total to the user' do
      expect { subject.add_item "burger", 2 }.to output(order_1).to_stdout
    end

    it 'updates the basket' do
      subject.add_item("burger", 2)
      expect(subject.basket.last).to eq ({:burger => 3})
    end
  end

  context '#print_total' do

    it 'allows the user to call print_total' do
      expect(subject).to respond_to(:print_total)
    end

    it 'gives the user their current total' do
      subject.add_item("burger", 2)
      expect(subject.print_total).to eq 6
    end

    it 'gives the user an updated total' do
      subject.add_item("cheeseburger", 3)
      subject.add_item("burger", 2)
      expect(subject.print_total).to eq 18
    end
  end

  context '#checkout' do
    order_2 = "In your basket is [{:burger=>3}, {:burger=>3}] and you're current total is £6\n"

     it 'allows the user to call checkout' do
       expect(subject).to respond_to(:checkout)
     end

     it 'allows the user to see their final bill' do
       subject.add_item("burger", 2)
       expect{ subject.checkout }.to output(order_2).to_stdout
     end
  end
end
