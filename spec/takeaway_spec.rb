require 'takeaway'

describe Takeaway do
  it 'Is an instance of the takeaway class' do
    expect(subject).to be_an_instance_of Takeaway
  end

  describe '#show_menu' do
    it 'It should respond to the method show_menu' do
      expect(subject).to respond_to(:show_menu)
    end

    it 'It should show the menu when called' do

      expect { subject.show_menu }.to output("--- burger : 5.0 ---\n--- chips : 2.0 ---\n--- doughnut : 1.0 ---\n").to_stdout
    end

  end

  describe '#add_item' do
    it 'It should respond to the method add_item' do
      expect(subject).to respond_to(:add_item)
    end

    it 'Should add items to order' do
      subject.add_item("burger",2)
      expect(subject.order).to eq ["burger","burger"]
    end

    it 'When the add method is used twice the orders should both go to the order array' do
      subject.add_item("burger",2)
      subject.add_item("chips",2)
      expect(subject.order).to eq ["burger","burger","chips","chips"]
    end

    it 'Should add item price to total' do
      subject.add_item("burger",2)
      expect(subject.total).to eq 10.0
    end
  end

  describe '#check_total' do
    it 'It should respond to the method check total' do
      expect(subject).to respond_to(:check_total)
    end

    it 'should puts a message if total is right' do
      subject.add_item("burger",2)
      subject.check_total
    expect(subject.given_total).to eq subject.total
    end
  end




end
