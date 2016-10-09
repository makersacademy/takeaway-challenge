require "takeaway"

describe Takeaway do

  let(:dish_list) { DishList.new(Dish) }
  subject { described_class.new(dish_list) }

  describe "initialization" do
    it "can be initialized with a dish list" do
      expect(subject.dish_list).to eq dish_list
    end
  end

  describe "#load_dishes" do
    let (:filename) { "menu.csv" }
    let (:false_filename) { "some.csv" }

    it "should check if file exists" do
      expect(File).to receive(:exist?).with(filename)
      subject.load_dishes(filename)
    end

    it "should return error message when file doesnt exist" do
      allow(File).to receive(:exist?).with(false_filename).and_return false
      expect(subject.load_dishes(false_filename)).to eq "File '#{false_filename}' not found!"
    end

    it "should try to read the CSV data" do
      expect(CSV).to receive(:foreach).with(filename)
      subject.load_dishes(filename)
    end

    it "should add dishes to the dish list" do
      expect {subject.load_dishes(filename)}.to change{subject.dish_list.dishes.count}
    end
  end

  describe '#menu' do
    it 'should print the menu on the screen' do
      expect(STDOUT).to receive(:puts).with(dish_list)
      subject.menu
    end
  end

end
