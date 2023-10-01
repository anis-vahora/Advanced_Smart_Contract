// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Bridge2 is Ownable {
    address public counterpartBridge;
    IERC20 public token;

    event TransferToGanache(address from, uint256 amount);
    event ReceiveFromPolygon(address to, uint256 amount);

    constructor(IERC20 _token) {
        token = _token;
    }

    function setCounterpartBridge(address _counterpartBridge) public onlyOwner {
        counterpartBridge = _counterpartBridge;
    }

    function sendToGanache(uint256 amount) public {
        require(
            token.transferFrom(msg.sender, address(this), amount),
            "Transfer failed"
        );
        emit TransferToGanache(msg.sender, amount);
    }

    function receiveFromPolygon(address to, uint256 amount) public {
        require(
            msg.sender == counterpartBridge,
            "Only counterpart bridge can call"
        );
        require(token.transfer(to, amount), "Transfer failed");
        emit ReceiveFromPolygon(to, amount);
    }
}
