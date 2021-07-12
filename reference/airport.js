class Airport {
  constructor(weather = new Weather) {
      this._hangar = [];
      this._weather = weather;
      // typeof weather !== 'undefined' ? weather : new Weather();
  }

  planes() {
    return this._hangar;
  };

  clearForLanding(plane) {
    if (this.isStormy()) {
      throw new Error('cannot land during a storm');
    }
    this._hangar.push(plane);
  };

  clearForTakeoff(plane) {
    if (this.isStormy()) {
      throw new Error('cannot take off during a storm');
    } else {
      this._hangar.pop();
    }
  };

  isStormy() {
    return false;
  };

};
