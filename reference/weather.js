class Weather {
  constructor() {
    this._CHANCE_OF_STORMY = 7;
  }

  isStormy() {
    return (Math.random(10) > this._CHANCE_OF_STORMY);
  }
}
