class Menu
  # attr_reader :steakhouse

  def steakhouse
    @steakhouse = [
      starter: {
        'Galloway Tartare' => 8.5,
        'Allotment Beetroot' => 6.5,
        'Game Terrine' => 8.5,
        'BBQ Saddleback Pork Jowl' => 7.5,
        'Pan Fried Scallops' => 9
       },
      mains: {
        'Ox Cheek Bourguignon' => 15.5,
        'Holstein Beef Bavette' => 16.5,
        'Short Horn Beef Rump' => 19.5,
        'Belted Galloway Ribeye' => 25,
        'Long Horn Beef Fillet' => 27
      },
      desserts: {
        'Lemon Meringue Pie' => 6,
        'Chocolate & Honeycombe Sundae' => 6,
        'Sticky Toffee Pudding (v)' => 5.5,
        'Artisinal British Cheese Board' => 8.5,
        'Salted Caramel Affogato' => 4.5
      }
    ]
  end
end
