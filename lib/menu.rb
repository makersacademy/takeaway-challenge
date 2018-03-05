class Menu

  attr_reader :sides, :mains, :drinks

  def initialize()
    @sides = []
    @mains = []
    @drinks = []
  end

  def put(item)
    case item.tag
    when 'side'
      @sides.push(item)
    when 'main'
      @mains.push(item)
    when 'drink'
      @drinks.push(item)
    end
  end

  def get(index)
    case index[0]
    when 'S'
      @sides[index[1].to_i - 1]
    when 'M'
      @mains[index[1].to_i - 1]
    when 'D'
      @drinks[index[1].to_i - 1]
    end
  end

  def view
    p '---- sides ----'
    @sides.each_with_index do |side, index|
      p "S#{index +1}: #{side.name} - £#{side.price}"
    end
    p '---- mains ----'
    @mains.each_with_index do |main, index|
      p "M#{index +1}: #{main.name} - £#{main.price}"
    end
    p '---- drinks ----'
    @drinks.each_with_index do |drink, index|
      p "D#{index +1}: #{drink.name} - £#{drink.price}"
    end
    p
  end

end
