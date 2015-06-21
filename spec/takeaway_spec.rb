require 'takeaway'

describe Takeaway do

  it{ is_expected.to respond_to(:view_dishes) }

  it 'displays dishes when view_dishes is called' do
  expect(subject.view_dishes).to eq({:bacon => 2.50, :cheese => 1.00, :pizza => 5.00, :cake => 4.32, :carrots => 1.20, :pie => 2.00})
  end

  context 'select_dish' do

    it{ is_expected.to respond_to(:select_dish).with(2).argument }

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

  context 'order_total' do

    it{ is_expected.to respond_to(:order_total) }

    it 'gives the correct order value with 1 dish' do
      subject.select_dish(:bacon, 1)
      expect(subject.order_total).to eq 2.50
    end

    it 'gives the correct order value with 2 dishes' do
      subject.select_dish(:bacon, 1)
      subject.select_dish(:cheese, 1)
      expect(subject.order_total).to eq 3.50
    end

    it 'gives the correct value when ordering 2 of the same dish' do
      subject.select_dish(:bacon, 2)
      expect(subject.order_total).to eq 5.00
    end
  end

  context 'check_payment' do

    it{ is_expected.to respond_to(:check_payment).with(1).argument }

    it 'says payment correct when amount given matches order total' do
      subject.select_dish(:bacon, 2)
      expect(subject.check_payment 5.00).to eq 'payment correct'
    end

    it 'says payment incorrect when amount given doesn\'t match order total' do
      subject.select_dish(:bacon, 2)
      expect{ subject.check_payment 4.00 }.to raise_error 'incorrect payment amount'
    end
  end

  context 'delivery time' do

    it{ is_expected.to respond_to(:delivery_time) }

    it 'gives a time 1 hour later when asked for delivery time' do
      allow(Time).to receive(:now) { Time.new(2015,6,21, 13,30,0, "+01:00") }
      expect(subject.delivery_time).to eq(Time.new(2015,6,21, 14,30,0, "+01:00"))
    end

  end
end