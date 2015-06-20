require 'order'

describe Order do

  let(:menu) do

    double :menu, view: {pepperoni:  10.0,
                         margharita:  8.0}

  end

  subject {Order.new(menu)}

  it {expect(subject).to respond_to(:add).with(2).argument}

  it 'should let customers see their order' do
    expect(subject.view_order).to eq ({})
  end

  it 'should let customers see their order total' do
    expect(subject.view_total).to eq 0
  end

  context 'add should' do
    it 'add a single pizza to the selection' do
      subject.add(:pepperoni, 1)
      expect(subject.view_order).to eq ({pepperoni: [1, 10 ]})
    end

    it 'update the order total when adding single pizza' do
      subject.add(:pepperoni, 1)
      expect(subject.view_total).to eq 10
    end

    it 'add more than one of a pizza to the selection' do
      subject.add(:pepperoni, 2)
      expect(subject.view_order).to eq ({pepperoni: [2, 20]})
    end

    it 'update the order total when adding more than one of a pizza' do
      subject.add(:pepperoni, 2)
      expect(subject.view_total).to eq 20
    end

    it 'only allow 1 type of pizza to be listed in the selection and update its number' do
      subject.add(:pepperoni, 2)
      subject.add(:pepperoni, 2)
      expect(subject.view_order).to eq ({pepperoni: [4, 40]})
    end

    it 'raise error if the pizza is not on the menu' do
      expect{subject.add(:burger, 1)}.to raise_error 'item not on menu'
    end

    it 'raise error if the quanity is negative' do
      expect{subject.add(:pepperoni, 1.5)}.to raise_error 'invalid number'
    end

     it 'raise error if the order has been completed' do
      subject.complete = true
      expect{subject.add(:pepperoni, 1.5)}.to raise_error 'order has already been completed'
    end


  end

  context 'remove should' do

    it 'let customers remove an item and update selection' do
      subject.add(:pepperoni, 5)
      subject.remove(:pepperoni,2)
      expect(subject.view_order).to eq ({pepperoni: [3, 30]})
    end

    it 'let customers remove an item and update total' do
      subject.add(:pepperoni, 5)
      subject.remove(:pepperoni,2)
      expect(subject.view_total).to eq 30
    end

    it 'raise error when you remove more pizzas than are in order' do
      subject.add(:pepperoni, 1)
      expect{subject.remove(:pepperoni, 2)}.to raise_error 'invalid number'
    end

    it 'raise error if the order has been completed' do
      subject.add(:pepperoni, 1)
      expect{subject.remove(:pepperoni, 2)}.to raise_error 'invalid number'
    end

  end

end
