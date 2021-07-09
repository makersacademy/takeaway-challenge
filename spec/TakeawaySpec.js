describe("Takeaway", () => {
  let pizza;
  let burger;
  let chocolateFugdeCake;
  let ggDelicatessen;

  beforeEach(() => {
    pizza = new Dish('pizza', 12);
    burger = new Dish('burger', 8.5);
    chocolateFugdeCake = new Dish('chocolate fudge cake', 7);
    ggDelicatessen = new Takeaway();
  });

  describe('.addToMenu()', () => {
    it('adds a Dish to the menu', () => {
      ggDelicatessen.addToMenu(pizza);
      expect(ggDelicatessen.getMenu()).toContain(pizza);
    });
  });

  // As a customer
  // So that I can check if I want to order something
  // I would like to see a list of dishes with prices
  describe('.getMenu()', () => {
    it('returns a list of dishes with prices', () => {
      ggDelicatessen.addToMenu(pizza);
      ggDelicatessen.addToMenu(burger);
      ggDelicatessen.addToMenu(chocolateFugdeCake);
      let menu = ggDelicatessen.getMenu();
      
      expect(menu).toEqual([pizza, burger, chocolateFugdeCake]);

      expect(menu[0].getPrice()).toEqual(12);
      expect(menu[1].getPrice()).toEqual(8.5);
      expect(menu[2].getPrice()).toEqual(7);

      expect(menu[0] instanceof Dish).toBe(true);
      expect(menu[1] instanceof Dish).toBe(true);
      expect(menu[2] instanceof Dish).toBe(true);
    });
  });
});
