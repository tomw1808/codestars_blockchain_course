pragma solidity >=0.5.0 <0.6.0;

contract GlobalObjects {
    /**
     * This is a sample code of global objects.
     * More in the solidity docs:
     * 
     * https://solidity.readthedocs.io/en/v0.4.25/units-and-global-variables.html
     * */
     
    uint balance;
    
    function payMeWillFail() public {
        //function will fail because not payable if transferred ether
    }
    
    function payMeSomething() payable public {
        balance += msg.value;
    }
    
    function withdraw(address payable _to) public {
        if(msg.sender == 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c) { 
            //we haven't learned exceptions yet, so an IF will do
            _to.transfer(address(this).balance);
        }
    }
    
    
}