pragma solidity >=0.5.0 <0.6.0;

contract C01HelloWorld {
    string public myString = "Hello World";
    
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
    
    function getMyString() public view returns(string memory) {
        return myString;
    }

	
}