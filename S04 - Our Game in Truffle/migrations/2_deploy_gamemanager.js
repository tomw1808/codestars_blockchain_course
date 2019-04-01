const GameManager = artifacts.require("GameManager");

module.exports = function(deployer) {
  deployer.deploy(GameManager);
};
