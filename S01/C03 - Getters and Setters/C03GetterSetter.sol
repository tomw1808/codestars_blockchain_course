pragma solidity >=0.5.0 <0.6.0;

contract GetterSetter {
    
    uint public myUint;
    uint public myOtherUint;
    
    mapping (uint => string) public myMapping;
    
    function setUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    function getMyUints() public view returns(uint, uint) {
        return (myUint, myOtherUint);
    }
    
    function getMyMapping(uint _key) public view returns(string memory) {
        bytes memory tempEmptyStringTest = bytes(myMapping[_key]);
        require(tempEmptyStringTest.length > 0, "The provided String is empty");
        return myMapping[_key];
    }
    
    
}