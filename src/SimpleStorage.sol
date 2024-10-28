//SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

contract SimpleStorage {
    mapping(address => uint) StorageWitAdrress;
    error UserNotFound();
    address[] NumUsers;

    function addFavNum(uint _favNum) public {
        StorageWitAdrress[msg.sender] = _favNum;
        NumUsers.push(msg.sender);
    }

    function DisplayFavoriteNum() public view onlyOwner returns (uint) {
        return StorageWitAdrress[msg.sender];
    }

    modifier onlyOwner() {
        bool _checkUser = false;
        for (uint i; i < NumUsers.length; i++) {
            if (NumUsers[i] == msg.sender) {
                _checkUser = true;
            }
        }
        if (!_checkUser) {
            revert UserNotFound();
        }
        _;
    }
}
