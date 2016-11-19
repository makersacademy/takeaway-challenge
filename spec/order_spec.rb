require 'order'

describe Order do

# subject(:order) { described_class.new}

  it {is_expected.to respond_to :list_of_dishes}

  it 'should respond with a hash' do
    expect(subject.list_of_dishes).to include( :pizza => "£9" )
  end

  context '#order' do

    it { is_expected.to respond_to(:order).with(1).argument }

    # it 'should return the price of an item when selected' do
    #   expect(subject.order(:pizza)).to eq "£9"
    # end

    it 'should return the pizza and a confirmation when 1 pizza is ordered' do
      expect(subject.order("pizza")).to eq "You have ordered pizza."
    end

  end


end
