pragma solidity ^0.5.0;

import {GameManager} from "./GameManager.sol";

contract ThreeInARow {
    
    GameManager gameManager;
    
    constructor(address _addrGameManager, address payable _player1) public payable {
        gameManager = GameManager(_addrGameManager);
        //more functionality here - later!
    }
    
    function joinGame() public payable {
        //here player2 joins the game
    }
    
    function getBoard() public view returns(address[3][3] memory) {
        //here we return the board
    }
    
    function setStone(uint8 x, uint8 y) public {
        //we set the stone here
    }
    
    function setWinner(address payable _player) private {
        
    }
    
    function setDraw() private {
        
    }
    
    function withdrawWin() public {
        
    }
    
    function emergencyCashout() public {
        
    }
}