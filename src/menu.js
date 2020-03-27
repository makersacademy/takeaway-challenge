'use strict';

function Menu() {
  this.dishes = {};
};

Menu.prototype.getDishes = function() {
    return this.dishes;
};
