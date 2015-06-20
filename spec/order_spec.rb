require 'order'

describe Order do

  let(:menu) do

    double :menu, view: {pepperoni:  10.0,
                         margharita:  8.0}

  end

  subject {Order.new(menu)}

  it {expect(subject).to respond_to(:select).with(2).argument}

  it 'should let customers see their selection' do
    expect(subject.view_selection).to eq ({})
  end

  it 'should let customers see their order total' do
    expect(subject.view_total).to eq 0
  end

  context 'select should' do
    it 'add a single pizza to the selection' do
      subject.select(:pepperoni, 1)
      expect(subject.view_selection).to eq ({pepperoni: [1, 10 ]})
    end

    it 'update the order total when adding single pizza' do
      subject.select(:pepperoni, 1)
      expect(subject.view_total).to eq 10
    end

    it 'add more than one of a pizza to the selection' do
      subject.select(:pepperoni, 2)
      expect(subject.view_selection).to eq ({pepperoni: [2, 20]})
    end

    it 'update the order total when adding more than one of a pizza' do
      subject.select(:pepperoni, 2)
      expect(subject.view_total).to eq 20
    end

    it 'only allow 1 type of pizza to be listed in the selection and update its number' do
      subject.select(:pepperoni, 2)
      subject.select(:pepperoni, 2)
      expect(subject.view_selection).to eq ({pepperoni: [4, 40]})
    end



  end

  context 'remove should' do

    it 'let customers remove an item and update selection' do
      subject.select(:pepperoni, 5)
      subject.remove(:pepperoni,2)
      expect(subject.view_selection).to eq ({pepperoni: [3, 30]})
    end

    it 'let customers remove an item and update total' do
      subject.select(:pepperoni, 5)
      subject.remove(:pepperoni,2)
      expect(subject.view_total).to eq 30
    end

  end

end
