class Menu
  attr_reader :menuItems
  def initialize
    @menuItems = [
      {name: 'ChickenPie', price: '5.50'},
      {name: 'BeefRagou', price: '7.90'},
      {name: 'SweetnSour', price: '4.05'},
      {name: 'CurrySauce', price: '1.15'},
      {name: 'PineappleSlices', price: '1.50'},
      {name: 'BatteredSosig', price: '2.55'},
      {name: 'Kipper', price: '6.70'},
      {name: 'RaspberryCompot', price: '2,95'},
      {name: 'Caviar', price: '25.01'},
      {name: 'LemonTart', price: '2.05'},
    ]
  end

  def menuOutput
    @menuItems
  end
end
