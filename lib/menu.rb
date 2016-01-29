class Menu

 def initialize
  @show = { ribs: 3,
      beef: 4,
      rolls: 3,
      chips: 2,
      pies: 5}
  end

  attr_reader :show
end