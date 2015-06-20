require 'order'

describe Order do

  let(:menu) do

    double :menu, view: {pepperoni:  10.0,
                         margharita:  8.0}

  end

  subject {Order.new(menu)}

  it {expect(subject).to respond_to(:select).with(1).argument}

  it 'should let customers see their selection' do
    expect(subject.view_selection).to eq ({})
  end

  it 'should let customers see their order total' do
    expect(subject.view_total).to eq 0
  end

  context 'select should' do
    it 'add a pizza to the selection' do
      subject.select(:pepperoni)
      expect(subject.view_selection).to eq ({pepperoni: 10})
    end

    it 'update the order total' do
      subject.select(:pepperoni)
      expect(subject.view_total).to eq 10
    end

  end

  context 'remove should' do

    it 'let customers remove an item and update selection' do
      subject.select(:pepperoni)
      subject.remove(:pepperoni)
      expect(subject.view_selection).to eq ({})
    end

    it 'let customers remove an item and update total' do
      subject.select(:pepperoni)
      subject.remove(:pepperoni)
      expect(subject.view_total).to eq 0
    end

  end

end
