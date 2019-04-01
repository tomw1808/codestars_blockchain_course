pragma solidity ^0.5.0;

contract GlobalObjects {
    /**
     * This is a sample code of global objects.
     * More in the solidity docs:
     * 
     * https://solidity.readthedocs.io/en/v0.4.25/units-and-global-variables.html
     * */
     
    address owner;
    uint myBalance;
    
    function setTheOwner(address _address) public {
        owner = _address;
    }
    
    function payMeSomething() payable public {
        myBalance += msg.value;
    }
    
    function withdraw(address payable _to) public {
        if(msg.sender == owner) {
            _to.transfer(1000000000000000000);
        }
    }
    
}