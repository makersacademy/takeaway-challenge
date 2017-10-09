class Menu
  attr_reader :dishes

  #option to inject the puts method as you can stub it then
  def initialize (stream: $stdout) #keyword argument - when you come to call you use stream:

    @stream = stream

    @dishes = {
      'sushi' => 5.99,
      'pizza' => 7.99,
      'burger' => 4.99,
      'pie' => 15.99,
      'water' => 2.99,
      'beer' => 3.99
    }
  end

  def show
    @stream.puts dishes.map { |dish| "#{dish[0]}: £#{dish[1]}" }.join("\n")
    #puts dishes.map { |dish| "#{dish[0]}: £#{dish[1]}" }.join("\n")
  end

  def on_menu?(dish)
    dishes.include?(dish)
  end

end
