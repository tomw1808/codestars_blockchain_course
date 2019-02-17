pragma solidity ^0.5.0;

contract C06ConstructorModifier {
    /**
     * This is a modifiers example for the course (checkout the readme)
     * Read the full docs here
     * https://solidity.readthedocs.io/en/latest/structure-of-a-contract.html#function-modifiers
     * */
     
    address public owner;
    
    function setTheOwner(address _address)  public {
        if(msg.sender == owner) {
            owner = _address;
        }
    }
    
    function payMeSomething() payable public {
        
    }
    
    function withdraw(address payable _to) public {
        if(msg.sender == owner) {
            _to.transfer(1000000000000000000);
        }
    }
    
}