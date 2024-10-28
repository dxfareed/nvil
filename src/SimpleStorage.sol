//SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

contract SimpleStorage {
    mapping(address => uint256) StorageWitAdrress;
    error UserNotFound();
    address[] NumUsers;

    function addFavNum(uint256 _favNum) public {
        StorageWitAdrress[msg.sender] = _favNum;
        NumUsers.push(msg.sender);
    }

    function DisplayFavoriteNum() public view onlyOwner returns (uint256) {
        return StorageWitAdrress[msg.sender];
    }

    modifier onlyOwner() {
        bool _checkUser = false;
        for (uint256 i; i < NumUsers.length; i++) {
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
