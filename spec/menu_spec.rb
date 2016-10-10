require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe 'initialization' do
    it 'will display a list of dishes with prices' do
      expect(subject).to eq [[":id", ":dish", ":price"],
     ["1", "libero nam dui", "8.18"],
     ["2", "habitasse", "3.14"],
     ["3", "eget eleifend luctus", "3.43"],
     ["4", "erat nulla", "0.71"],
     ["5", "ipsum primis", "8.33"],
     ["6", "luctus rutrum nulla", "2.52"],
     ["7", "fermentum donec", "5.89"],
     ["8", "nunc", "4.84"],
     ["9", "felis fusce posuere", "2.06"],
     ["10", "rutrum nulla", "3.46"],
     ["11", "integer non", "3.35"],
     ["12", "erat quisque", "3.88"],
     ["13", "nibh in lectus", "1.69"],
     ["14", "ultrices phasellus", "5.52"],
     ["15", "at diam", "9.33"],
     ["16", "in felis eu", "6.28"],
     ["17", "eget eros elementum", "1.34"],
     ["18", "odio", "2.17"],
     ["19", "tortor sollicitudin mi", "1.32"],
     ["20", "nisi at", "4.94"],
     ["21", "posuere cubilia curae", "6.79"],
     ["22", "faucibus accumsan", "6.32"],
     ["23", "justo nec condimentum", "0.78"],
     ["24", "justo", "4.91"],
     ["25", "elementum eu interdum", "1.56"]]
    end
  end
end
