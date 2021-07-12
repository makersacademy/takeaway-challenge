document.addEventListener("DOMContentLoaded", () => {
  const takeaway = new TakeAwayV2();
  const noodles = new Dish("noodles", 3.50);
  const prawnCrackers = new Dish("prawn crackers", 3.50);
  const chowMein = new Dish("chow mein", 5);
  const blackBean = new Dish("beef in black bean sauce", 7);



  let setupMenu = () => {
    takeaway.addDish(noodles);
    takeaway.addDish(prawnCrackers);
    takeaway.addDish(chowMein);
    takeaway.addDish(blackBean);
  };
  setupMenu();

  // let menuLength = (Object.keys(takeaway.menu)).length;
  // console.log(menuLength);



    console.log('hello')

  const menu = document.getElementById("menu-container");
  const basket = document.getElementById("basket");
  const checkout = document.getElementById("checkout");

  let buildMenuTable = (fullMenu) => {

    fullMenu.forEach( (dish) => {
      let item = document.createElement("li");
      let text = document.createTextNode(`${dish.name} - £${dish.price}`);

      let button = document.createElement("button");
      button.className = "btn btn-primary";
      button.id = dish.name;
      button.addEventListener('click', (e) => {
        takeaway.select(e.target.id);
        refreshBasket();
        runningTotal();
      });
      let buttonText = document.createTextNode("Add ");
      button.appendChild(buttonText);

      item.appendChild(text);
      item.appendChild(document.createElement("br"));
      item.appendChild(button);

      menu.appendChild(item);
      menu.appendChild(document.createElement("br"));
  });
    };
    buildMenuTable(takeaway.menu);


  let refreshBasket = () => {
    basket.innerHTML = '';

    takeaway.showBasket().forEach((dish) => {
    let item = document.createElement("li");
    let text = document.createTextNode(`${dish.name} - £${dish.price}        `);

    let button = document.createElement("button");
    button.className = "btn btn-danger";
    button.id = dish.name;
    button.addEventListener('click', (e) => {
      takeaway.remove(e.target.id);
      refreshBasket();
      runningTotal();
    });
    let buttonText = document.createTextNode("Remove ");

    item.appendChild(text);
    basket.appendChild(item);

    button.appendChild(buttonText);
    item.appendChild(button);
    });
  };

  let runningTotal = () => {
     checkout.innerHTML = `Your total is £${takeaway.totalBasket()}`;
  };

  //
  //
  //   let menuLength = menu.length;
  //
  //   var result = "<table border=1>";
  //   for(var i=0; i<menuLength; i++) {
  //
  //
  //
  //       result += "<tr>";
  //       for(var j=0; j<2; j++){
  //           result += "<td>"+menu[i].name+"</td>";
  //       }
  //       result += "</tr>";
  //   }
  //   result += "</table>";
  //
  //   return result;
  //
  //
  // };
  // document.getElementById("menu-table").innerHTML = makeTableHTML(takeaway.menu);
});






// const menuData = require("./menu.js");

// import { menu } from './menu.js';

// let buildTable = (myArray) => {
//   var tableBody = document.getElementById("menu-table");
//
//   // Reset the table
//   tableBody.innerHTML = "";
//
//   // Build the new table
//   myArray.forEach( (row) => {
//       var newRow = document.createElement("tr");
//       tableBody.appendChild(newRow);
//
//       if (row instanceof Array) {
//           // const button = ""
//           row.push('<button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button>')
//           row.forEach( (cell) => {
//               var newCell = document.createElement("td");
//               newCell.textContent = cell;
//               newRow.appendChild(newCell);
//           });
//       } else {
//           newCell = document.createElement("td");
//           newCell.textContent = row;
//           newRow.appendChild(newCell);
//       }
//   });
// }
//
// buildTable(array);
//
// function
