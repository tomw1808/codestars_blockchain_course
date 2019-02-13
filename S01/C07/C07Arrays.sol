pragma solidity >=0.5.0 <0.6.0;

/**
 * Arrays example for the course
 * 
 * Read more about arrays here:
 * https://solidity.readthedocs.io/en/latest/types.html#arrays
 * */
     
contract Arrays {
    
    
    uint[5] public arrayFixedSize;
    uint[] public arrayDynamicSize;
    uint[2][] public arrayFixedDynamic;
    
    function getFixedArray() view public returns(uint[5] memory) {
        return arrayFixedSize;
    }
    
    function getFixedDynamic() view public returns(uint, uint) {
        return (arrayFixedDynamic.length,arrayFixedDynamic[0].length);
    }
    
    function getDynamicAll() view public returns(uint[2][] memory) {
        return arrayFixedDynamic;
    }
    
    function increaseFixedDynamicLength() public {
        arrayFixedDynamic.length++;
        arrayFixedDynamic[arrayFixedDynamic.length-1][0] = 123;
        arrayFixedDynamic[arrayFixedDynamic.length-1][1] = 234;
        
    }
}