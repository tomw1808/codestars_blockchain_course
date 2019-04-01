pragma solidity ^0.5.0;

contract C01HelloWorld {
    uint256 public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    string public helloWorld = "Hello World!";
    
    function writeHelloWorld(string memory _helloWorld) public {
        helloWorld = _helloWorld;
    }
    
    function getHelloWorld() public view returns(string memory) {
        return helloWorld;
    }
}