// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {VIDAO} from "../src/VIDAO.sol";

contract DeployVIDAO is Script {
    function run() external returns (VIDAO) {
        vm.startBroadcast();
        VIDAO vidao = new VIDAO(address(this));
        vm.stopBroadcast();
        return vidao;
    }
}
