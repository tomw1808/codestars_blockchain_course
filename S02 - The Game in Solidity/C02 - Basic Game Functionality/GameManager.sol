pragma solidity ^0.5.0;

import {ThreeInARow} from "./ThreeInARow.sol";
import {HighscoreManager} from "./Highscoremanager.sol";

contract GameManager {
    
    HighscoreManager highscoremanager;
    
    constructor() public {
        highscoremanager = new HighscoreManager(address(this));
    }
    
    function enterWinner(address _winner) public {
        
    }
    
    function getTop10() public view {
        
    }
    
    function startNewGame() public payable {
        
    }
    
}