// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

contract StorageFactory is SimpleStorage {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function getStorage(uint256 _simpleStorageIndex) private view returns (SimpleStorage) {
        return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address
        // ABI Application Binary Interface
        getStorage(_simpleStorageIndex).store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return getStorage(_simpleStorageIndex).retrieve();
    }
}