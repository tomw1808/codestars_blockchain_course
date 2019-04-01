pragma solidity ^0.5.0;

contract C09ViewPureFunctions {
    uint myUint = 5;

    /**
     * Writing functions are neither view or pure
     */
    function setMyUint(uint _uint) public {
        myUint = _uint;
    }

    /**
     * View Functions access state variables or other view and pure functions
     */
    function getMyUint() public view returns(uint) {
        return myUint;
    }

    /**
     Pure Functions only access itself or other pure functions
     */
    function multiplyByFive(uint _someNumber) public pure returns(uint) {
        return _someNumber*5;
    }

    //assignment solution: 5 times the uint
    function fiveTimesMyUint() public view returns(uint) {
        return multiplyByFive(myUint);
    }
}