class Menu

  def initialize(menu_loader_klass:)
    @dishes = menu_loader_klass.new.load("./support/data.yaml")
  end

  def choose(description)
    @dishes.detect {|dish| dish.description == description}
  end

  def dishes
    @dishes.dup
  end

  def to_s
    @dishes.inject('') {|memo, dish| memo << "#{dish}\n" }
  end
end
