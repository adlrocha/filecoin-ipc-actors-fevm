// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;

import "../constants/Constants.sol";
import "fevmate/utils/FilAddress.sol";

/// @title Helper library for checking account type
/// @author LimeChain team
library AccountHelper {
    function isAccount(address _address) internal view returns (bool) {
        uint size;

        assembly {
            size := extcodesize(_address)
        }

        return
            size == 0 &&
            ADDRESS_CODEHASH == _address.codehash &&
            ADDRESS_CODEHASH == keccak256(_address.code);
    }

    function isSystemActor(address _address) internal pure returns (bool) {
        return _address == FilAddress.SYSTEM_ACTOR;
    }
}
