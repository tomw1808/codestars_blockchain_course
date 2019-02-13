pragma solidity ^0.4.25;

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
     
     modifier onlyOwner() {
         require(msg.sender == owner);
         _;
     }
     
     modifier onlyDuringActiveAuction() {
         require(auctionRunning);
         _;
     }
     
     function setAuctionRunning(bool _auctionRunning) onlyOwner public {
             auctionRunning = _auctionRunning;
     }
     
     function moveOwnership(address _newOwner) onlyOwner public {
             owner = _newOwner;
     }
     
     function bidOnItem(uint _itemId) onlyDuringActiveAuction public payable {

        //do something with the money
        
        /**
         * From there would a bidding logic follow for items
         * this is abbrevated for readability
         * */
     }
     
     
}