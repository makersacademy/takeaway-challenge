require "spec_helper"

describe Restaurant do
  let(:menu) {Menu.new}

  # describe '#initialize' do
  #   it 'creates menu which is an array of hashes' do
  #     expect( subject.menu.class ).to eq(Array)
  #   end
  # end

  describe '#read_menu' do
    it 'prints to the standard output (ie screen)' do
      expect { subject.read_menu }.to output.to_stdout
    end
  end

  describe '#select' do
    it 'returns and error if the item is not on the list' do
      expect {subject.select(1000,1)}.to raise_error "You entered a number that does not corespond to our menu :( Please try again."
    end

    it 'returns and error if quantity is not a number' do
      expect {subject.select(1,"1")}.to raise_error "You entered an invalid quantity. Enter a number for the quantity"
    end

    it 'takes users order for correct inputs' do
      subject.select(1,2)
      expect(subject.select(2,1)).to eq([{:dish=>"fries", :price=>1.0, :quantity=>2}, {:dish=>"fish", :price=>1.5, :quantity=>1}])
    end
  end

  describe '#cart' do
    it 'prints the contents of the cart to the screen in readable list' do
      subject.select(1,2)
      expect { subject.cart }.to output.to_stdout
    end

    it 'returns the contents of the cart' do
      subject.select(1,2)
      expect(subject.cart).to eq([{:dish=>"fries", :price=>1.0, :quantity=>2}])
    end
  end

  describe 'total' do
    it 'returns the contents of the cart tot the screen' do
      subject.select(1,2)
      subject.select(2,1)
      expect(subject.total).to eq("Your total is £3.5")
    end
  end
end
