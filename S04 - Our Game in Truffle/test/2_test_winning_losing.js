const GameManager = artifacts.require("GameManager");
const ThreeInARow = artifacts.require("ThreeInARow");

contract("ThreInARow Test Win", accounts => {
    it("should be possible to win the game", async () => {
        let gameManagerInstance = await GameManager.deployed();
        let txReceipt = await gameManagerInstance.startNewGame({from: accounts[0], value: web3.utils.toWei("0.1","ether")});
        let threeInARowInstance = await ThreeInARow.at(txReceipt.logs[0].args._gameAddress);
        let txReceiptJoin = await threeInARowInstance.joinGame({from: accounts[1], value: web3.utils.toWei("0.1","ether")});
        assert.equal("NextPlayer",txReceiptJoin.logs[1].event);

        let txReceiptPlayed = await threeInARowInstance.setStone(0,0,{from:txReceiptJoin.logs[1].args._player});
        //console.log(txReceiptPlayed.logs[0].args);
        txReceiptPlayed = await threeInARowInstance.setStone(0,1,{from:txReceiptPlayed.logs[0].args._player});
        txReceiptPlayed = await threeInARowInstance.setStone(1,1,{from:txReceiptPlayed.logs[0].args._player});
        txReceiptPlayed = await threeInARowInstance.setStone(1,2,{from:txReceiptPlayed.logs[0].args._player});
        let winningPlayer = txReceiptPlayed.logs[0].args._player;
        txReceiptPlayed = await threeInARowInstance.setStone(2,2,{from:txReceiptPlayed.logs[0].args._player});

        assert.equal(winningPlayer,txReceiptPlayed.logs[1].args._winner, "The winner is not the winner");
        let board = await threeInARowInstance.getBoard();
        assert.equal(winningPlayer, board[0][0], "Left top is occupied by the winner");
        assert.equal(winningPlayer, board[1][1], "Center is occupied by the winner");
        assert.equal(winningPlayer, board[2][2], "Bottom right is occupied by the winner");

    });

});