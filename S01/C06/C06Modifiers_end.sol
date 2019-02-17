pragma solidity ^0.5.0;

contract C06ConstructorModifier {
    
    address public owner;
    
    bool public auctionIsRunning = true;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        if(msg.sender == owner) {
            _;
        }
    }
    
    modifier auctionMustBeRunning() {
        require(auctionIsRunning);
        _;
    }
    
    function setAuctionRunning(bool _auctionIsRunning) onlyOwner public {
        auctionIsRunning = _auctionIsRunning;
    }
    
    function setTheOwner(address _address) onlyOwner public {
            owner = _address;
    }
    
    function payMeSomething() auctionMustBeRunning payable public {
        
    }
    
    function withdraw(address payable _to) onlyOwner public {
            _to.transfer(1000000000000000000);
    }
     
     
}