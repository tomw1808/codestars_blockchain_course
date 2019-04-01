pragma solidity ^0.5.0;

contract C10Time {

    /**
     * Documentation is here:
     * https://solidity.readthedocs.io/en/v0.5.4/units-and-global-variables.html#time-units
     */
    uint startDate = now;
    uint runDays = 10;

    function getTimestamp() public view returns(uint) {
        return now;
    }
    
    function isStillRunning() public view returns(bool) {
        return (now <= (now + runDays * 1 days));
    }
}