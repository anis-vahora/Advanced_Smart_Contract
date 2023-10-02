// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LendingContract {
    IERC20 public token;
    mapping(address => uint256) public deposits;
    uint256 public totalLiquidity;
    event LiquidityUpdated(uint256 totalLiquidity);

    event Borrowed(address borrower, uint256 amount);

    constructor(IERC20 _token) {
        token = _token;
    }

    function deposit(uint256 amount) public {
        require(
            token.transferFrom(msg.sender, address(this), amount),
            "Transfer failed"
        );
        deposits[msg.sender] += amount;
        totalLiquidity += amount;
        emit LiquidityUpdated(totalLiquidity);
    }

    function borrow(uint256 amount) public {
        require(totalLiquidity >= amount, "Not enough liquidity");
        require(token.transfer(msg.sender, amount), "Transfer failed");
        totalLiquidity -= amount;

        emit Borrowed(msg.sender, amount);

        emit LiquidityUpdated(totalLiquidity);
    }
}
