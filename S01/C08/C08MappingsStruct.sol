pragma solidity >=0.5.0 <0.6.0;

contract MappngsStructs {
    
    /**
     * Example 1:
     * Very simple mapping between two types
     * 
     * map from an address to a boolean
     * 
     * Practically it's used to show that something was set by an address
     * 
     * All variables are initialized by default - so, it's good to know when something was set for sure!
     * */
    mapping(address => bool) public myAddressBoolMapping;
    
    function writeBoolMapping(address _address, bool _bool) public {
        myAddressBoolMapping[_address] = _bool;
    }
    
    function writeBoolMapping(bool _bool) public {
        myAddressBoolMapping[msg.sender] = _bool;
    }
     
    /**
     * Example 2:
     * More traditional example where a balance is increased or decreased for an address.
     * 
     * Pracitaclly when someone deposits or withdraws ether/tokens a datastructure needs to be updated
     * */
    mapping(address => uint) public myBalanceForAddress;
    
    function depositMapping() public payable {
        assert(myBalanceForAddress[msg.sender] + msg.value >= myBalanceForAddress[msg.sender]);
        myBalanceForAddress[msg.sender] += msg.value;
    } 
    
    function withdrawMapping(address _to, uint _amount) public {
        /**
         * Check if enough balance is available
         * */
        require(myBalanceForAddress[msg.sender] >= _amount, "Error: Not enough balance");
        assert(myBalanceForAddress[msg.sender] - _amount <= myBalanceForAddress[msg.sender]);
        
        /**
         * Then transfer the _amount
         * */
        myBalanceForAddress[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
     
    /**
     * Example 3:
     * Complex example of writing a struct and mapping
     * 
     * A struct is like your own datastructure
     * 
     * Similar to creating a class in other programming languages
     * */
    struct MyStruct {
        uint balance;
        bool isSet;
        uint lastUpdated;
    }
    
    mapping(address => MyStruct) public myStructForAddress;
    
    function depositStruct(address _for) public payable {
        myStructForAddress[_for].isSet = true;
        
        assert(myStructForAddress[_for].balance + msg.value > myStructForAddress[_for].balance);
        myStructForAddress[_for].balance += msg.value;
        
        //now is a global object containing the timestamp of the current block
        myStructForAddress[_for].lastUpdated = now;
    }
    
    function withdrawStruct(address _to, uint _amount) public {
        require(myStructForAddress[msg.sender].balance >= _amount, "Error, not enough balance");
        assert(myStructForAddress[msg.sender].balance - _amount <= myStructForAddress[msg.sender].balance);
        
        myStructForAddress[msg.sender].balance -= _amount;
        
        _to.transfer(_amount);
    }
}