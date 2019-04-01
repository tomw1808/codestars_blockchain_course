pragma solidity ^0.5.0;

import {ThreeInARow} from "./ThreeInARow.sol";
import {HighscoreManager} from "./Highscoremanager.sol";

contract GameManager {
    
    HighscoreManager highscoremanager;
    
    event EventGameCreated(address _player, address _gameAddress);
    
    mapping(address => bool) allowedToEnterHighscore;
    
    constructor() public {
        highscoremanager = new HighscoreManager(address(this));
    }
    
    modifier onlyInGameHighscoreEditing() {
        require(allowedToEnterHighscore[msg.sender], "You are not allowed to Enter a Highscore");
        _;
    }
    
    function enterWinner(address _winner) public onlyInGameHighscoreEditing {
        highscoremanager.addWin(_winner);
    }
    
    function getTop10() public view {
        
    }
    
    function startNewGame() public payable {
        ThreeInARow threeInARow = (new ThreeInARow).value(msg.value)(address(this), msg.sender);
        allowedToEnterHighscore[address(threeInARow)] = true;
        emit EventGameCreated(msg.sender, address(threeInARow));
    }
    
}