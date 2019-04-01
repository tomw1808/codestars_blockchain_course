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
    
    struct Highscore {
        
        uint numberOfWins;
        uint timeOfLastWin;
    }
    
    mapping(address => Highscore) public highscoreMapping;
    address public highscoreHolder;
    
    function addWin(address _for) public onlyGameManager {
        highscoreMapping[_for].numberOfWins++;
        highscoreMapping[_for].timeOfLastWin = now;
        
        if(highscoreMapping[highscoreHolder].numberOfWins <= highscoreMapping[_for].numberOfWins) {
            highscoreHolder = _for;
        }
    }
    
    function getTop10() public view {
        
    }
}