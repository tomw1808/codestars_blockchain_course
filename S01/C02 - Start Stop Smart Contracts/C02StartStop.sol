pragma solidity >=0.5.0 <0.6.0;

contract StartStop {
    
    function killMe() public {
        selfdestruct(msg.sender);
    }
}