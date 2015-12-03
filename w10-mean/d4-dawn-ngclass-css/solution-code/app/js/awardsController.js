angular.module('Awwward')
  .controller('awardsController', ['globalAlertService', function AwardsController(globalAlertService){
    this.newWinner = {};
    this.winners = [
      {name: "Winston Inner"},
      {name: "Justhe Besse"},
      {name: "Sophia Close"},
      {name: "Chappy Goluckee"},
      {name: "Barry Wheldon"},
      {name: "Curtis Rusty"},
      {name: "Noah Ward" }
    ];
    this.createNewWinner = createNewWinner;

    function createNewWinner(){
      this.winners.push(this.newWinner);
      globalAlertService.add("success", this.newWinner.name + " just won!");
      this.newWinner = {};
    }
  }]);