pragma solidity ^0.5.0;

contract C11ExceptionsInSolidity {
    bool isRunning = false;
    address owner;

    mapping(address => uint) balance;
    
      
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyIfRunning() {
        require(isRunning, "The Auction is not running at the moment");
        _;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the Owner of the Smart Contract");
        _;
    }
  
    function setRunning(bool _running) public onlyOwner {
        isRunning = _running;
    }
    

    function bidOnItem() public payable onlyIfRunning {
        balance[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(balance[msg.sender] >= _amount, "Your Balance is not high enough");
        balance[msg.sender] -= _amount;
        assert(balance[msg.sender] <= balance[msg.sender] + _amount);
        _to.transfer(_amount);
    }
}