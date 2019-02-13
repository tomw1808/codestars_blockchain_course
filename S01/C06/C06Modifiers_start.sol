pragma solidity >=0.5.0 <0.6.0;

contract Modifiers {
    /**
     * This is a modifiers example for the course (checkout the readme)
     * Read the full docs here
     * https://solidity.readthedocs.io/en/latest/structure-of-a-contract.html#function-modifiers
     * */
     
    bool auctionRunning = true;
    address owner;

    constructor() public {
        owner = msg.sender;
    }
     
    function setAuctionRunning(bool _auctionRunning) public {
        if(msg.sender == owner) {
            auctionRunning = _auctionRunning;
        }
    }
     
    function moveOwnership(address _newOwner) public {
        if(msg.sender == owner) {
            owner = _newOwner;
        }
    }
     
    function bidOnItem(uint _itemId) public payable {
        /**
         * require is throwing an exception if it evaluates to false
         * we'll discuss it later in the course
         * */
        require(auctionRunning);
        //do something with the money
       
        /**
        * From there would a bidding logic follow for items
        * this is abbrevated for readability
        * */
    }
    
    
}