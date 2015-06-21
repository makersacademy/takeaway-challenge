require 'takeaway'

describe Takeaway do

  it{ is_expected.to respond_to(:view_dishes) }

  it 'displays dishes when view_dishes is called' do
  expect(subject.view_dishes).to eq({:bacon => 2.50, :cheese => 1.00, :pizza => 5.00, :cake => 4.32, :carrots => 1.20, :pie => 2.00})
  end

  context 'select_dish' do

    it{ is_expected.to respond_to(:select_dish)}

    it 'allows the selection of "bacon" from the menu' do
    expect(subject.select_dish(:bacon, 1)).to eq [[:bacon, 1]]
    end

    it 'allows the selection of multiple dishes from the menu' do
    subject.select_dish(:bacon, 1)
    expect(subject.select_dish(:cheese, 2)).to eq [[:bacon, 1], [:cheese, 2]]
    end

    it 'doesn\'t allow for dishes not on the menu to be ordered' do
    expect{subject.select_dish(:fish, 1)}.to raise_error 'dish not on menu'
    end
  end

  context 'order_value' do

  it{is_expected.to respond_to(:order_value )}

  it 'gives the correct order value with 1 dish' do
    subject.select_dish(:bacon, 1)
    expect(subject.order_value).to eq 2.50
  end



  end
end