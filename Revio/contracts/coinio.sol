// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

/** 
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
contract Revio{
    int256 wallet;
    int256 subscription;
    int256 minimumSubscription;

    constructor() public{
        wallet = 0;
        subscription = 0;
        minimumSubscription = 7;
    }

function getWallet() public view returns (int256) {
 return wallet;
}

function getSubscription() public view returns (int256) {
 return subscription;
}

function changeSubscription(int256 amount) public {
    if(subscription + amount >= minimumSubscription)
    {
        subscription += amount;
    }
}

function addFunds(int256 amount) public{
    if(wallet + amount >= 0){
        wallet += amount;
    }
}
}