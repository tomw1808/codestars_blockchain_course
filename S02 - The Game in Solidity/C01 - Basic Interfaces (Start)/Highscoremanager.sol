pragma solidity ^0.5.0;

contract HighscoreManager {
    address gameManager;
    
    constructor(address _gameManager) public {
        gameManager = _gameManager;
    }
    
    modifier onlyGameManager() {
        require(msg.sender == gameManager);
        _;
    }
}