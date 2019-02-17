pragma solidity ^0.5.0;

contract Variables {
    
    /**
     * Booleans Example
     **/
    bool public myBool = false;
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    /**
     * 
     * (Unsigned) Integer Examples 
     **/
    uint8 public myUint8 = 255; //2**8-1
    uint32 public myUint32 = 4294967295; //2**32-1
    uint256 public myUint256 = 2**256-1; //very long :) try!
    
    int8 public myInt8 = 127; //-2**4 to 2**4-1
    
    function myUintDivisionExample() public pure returns (uint8) {
        uint8 five = 5;
        uint8 two = 2;
        return five/two;
    }
    
    function myUintWrapAround() public pure returns(uint8) {
        uint8 myZeroUint = 0;
        myZeroUint--; //zero minus 1 == ?
        return myZeroUint;
    }
    
    /**
     * Fixed Points are not supported
     * */
     //fixed myFixed; //can't be used atm
    
    /**
     * Address Examples
     * Must be payable in order to use .transfer
     * */
    address payable public myAddress;
    
    function setAddress(address payable _address) public {
        myAddress = _address;
    }
    
    function payme() payable public {
        
    }
    
    function transferTheMoneyOut() public {
        myAddress.transfer(address(this).balance);
    }
     
     //address literals like 0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF have to pass the checksum test for addresses, or else they are treated as bytes20
     
     /**
      * Fixed size byte arrays
      * Operators: 
      * Comparisons: <=, <, ==, !=, >=, > (evaluate to bool)
      * Bit operators: &, |, ^ (bitwise exclusive or), ~ (bitwise negation), << (left shift), >> (right shift)
      * Index access: If x is of type bytesI, then x[k] for 0 <= k < I returns the k th byte (read-only).
      * https://solidity.readthedocs.io/en/v0.4.25/types.html#fixed-size-byte-arrays
      * */
      
    bytes1 public myBytes1 = 0xFF; //2 hex chars
    bytes32 public myBytes32 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; //64 hex chars
    
    function myBytesCompare() public view returns(bool) {
        return myBytes1 < myBytes32;
    }
    
    function getMyBytesLength() public view returns(uint) {
        return myBytes1.length;
    }
     
}