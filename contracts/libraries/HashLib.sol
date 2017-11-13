/*
    Copyright 2017 Phillip A. Elsasser

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/
pragma solidity 0.4.18;


library HashLib {

    function createOrderHash(
        address contractAddress,
        address makerAddress,
        address feeRecipient,
        uint makerFee,
        uint takerFee,
        int qty,
        uint price,
        uint expirationTimeStamp
    ) public pure returns (bytes32) {
        return keccak256(contractAddress, makerAddress, feeRecipient,
        makerFee, takerFee, qty, price, expirationTimeStamp);
    }

    function isValidSignature(
        address signerAddress,
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public pure returns (bool) {
        return signerAddress == ecrecover(keccak256("\x19Ethereum Signed Message:\n32", hash), v, r, s);
    }
}

