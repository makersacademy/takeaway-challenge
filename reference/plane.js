class Plane {
  constructor() {
    this.__location;
  }

  land(airport) {
    airport.clearForLanding(this);
    this._location = airport;
  };

  takeoff() {
    this._location.clearForTakeoff()
  }

};
