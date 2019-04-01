pragma solidity ^0.5.0;

contract GetterSetter {
    uint256 public myUint;
    uint256 public myOtherUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    function setBothValues(uint _myUint, uint _myOtherUint) public {
        myUint = _myUint;
        myOtherUint = _myOtherUint;
    }
    
    function getBothValues() public view returns(uint, uint) {
        return (myUint, myOtherUint);
    }
    
}