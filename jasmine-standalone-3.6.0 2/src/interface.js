$(document).ready(function() {
  var menu = new Menu();

  $('#start-over').click(function() {
    location.reload();
    var menu = new Menu();
  })

  $('#quantity-increase0').click(function() {
    menu.increase(0);
    updateQuantity(0);
  })
    $('#quantity-increase1').click(function() {
      menu.increase(1);
      updateQuantity(1);
    })
      $('#quantity-increase2').click(function() {
        menu.increase(2);
        updateQuantity(2);

      })
        $('#quantity-increase3').click(function() {
          menu.increase(3);
          updateQuantity(3);

       })
          $('#quantity-increase4').click(function() {


            menu.increase(4);
            updateQuantity(4);

          })
            $('#quantity-increase5').click(function() {
              let number = 5;
              menu.increase(5);
              updateQuantity(5);

            });

    $('#quantity-decrease0').click(function() {

      menu.decrease(0);
      updateQuantity(0);

    })
      $('#quantity-decrease1').click(function() {
        menu.decrease(1);
        updateQuantity(1);

      })
        $('#quantity-decrease2').click(function() {
          menu.decrease(2);
          updateQuantity(2);

        })
          $('#quantity-decrease3').click(function() {
            menu.decrease(3);
            updateQuantity(3);

          })
            $('#quantity-decrease4').click(function() {
              menu.decrease(4);
              updateQuantity(4);

            })




            function updateQuantity(number) {
              $(`#quant-${number}`).text(menu.items[number]["quantity"]);
            };

            $('#accept-bill').click(function() {
              menu.choice();
              // menu.total();
  })

});
