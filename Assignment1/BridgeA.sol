// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Bridge1 is Ownable {
    address public counterpartBridge;
    IERC20 public token;

    event TransferToPolygon(address from, uint256 amount);
    event ReceiveFromGanache(address to, uint256 amount);

    constructor(IERC20 _token) {
        token = _token;
    }

    function setCounterpartBridge(address _counterpartBridge) public onlyOwner {
        counterpartBridge = _counterpartBridge;
    }

    function sendToPolygon(uint256 amount) public {
        require(
            token.transferFrom(msg.sender, address(this), amount),
            "Transfer failed"
        );
        emit TransferToPolygon(msg.sender, amount);
    }

    function receiveFromGanache(address to, uint256 amount) public {
        require(
            msg.sender == counterpartBridge,
            "Only counterpart bridge can call"
        );
        require(token.transfer(to, amount), "Transfer failed");
        emit ReceiveFromGanache(to, amount);
    }
}
