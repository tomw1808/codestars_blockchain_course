pragma solidity >=0.5.0 <0.6.0;

contract StartStop {
    uint public myUint;
    
    function increment() public {
        myUint++;
    }
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    function getMyUint() public view returns(uint) {
        return myUint;
    }


    
    function killMe() public {
        selfdestruct(msg.sender);
    }
}