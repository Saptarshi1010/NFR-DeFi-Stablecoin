/** @dev Commented out for now until fail_on_revert == false per function customization is implemented in foundry.toml */

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
// import {Test} from "forge-std/Test.sol";
// import {ERC20Mock} from "@openzeppelin/contracts/mocks/ERC20Mock.sol";
// import {MockV3Aggregator} from "../../mocks/MockV3Aggregator.sol";
// import {NFREngine, AggregatorV3Interface} from "../../../src/NFREngine.sol";
// import {NeftyrStableCoin} from "../../../src/NeftyrStableCoin.sol";
// //import {Randomish, EnumerableSet} from "../Randomish.sol";
// import {MockV3Aggregator} from "../../mocks/MockV3Aggregator.sol";
// import {console} from "forge-std/console.sol";

// /** @dev Handler is going to narrow down the way we call functions (this way we do not waste runs) */

// contract ContinueOnRevertHandler is Test {
//     using EnumerableSet for EnumerableSet.AddressSet;
//     //using Randomish for EnumerableSet.AddressSet;

//     // Deployed contracts to interact with
//     NFREngine public nfre;
//     NeftyrStableCoin public nfr;
//     MockV3Aggregator public ethUsdPriceFeed;
//     MockV3Aggregator public btcUsdPriceFeed;
//     ERC20Mock public weth;
//     ERC20Mock public wbtc;

//     // Ghost Variables
//     uint96 public constant MAX_DEPOSIT_SIZE = type(uint96).max;

//     constructor(NFREngine _nfre, NeftyrStableCoin _nfr) {
//         nfre = _nfre;
//         nfr = _nfr;

//         address[] memory collateralTokens = nfre.getCollateralTokens();
//         weth = ERC20Mock(collateralTokens[0]);
//         wbtc = ERC20Mock(collateralTokens[1]);

//         ethUsdPriceFeed = MockV3Aggregator(nfre.getCollateralTokenPriceFeed(address(weth)));
//         btcUsdPriceFeed = MockV3Aggregator(nfre.getCollateralTokenPriceFeed(address(wbtc)));
//     }

//     // FUNCTIONS TO INTERACT WITH

//     /////////////////////
//     /** @dev NFREngine */
//     /////////////////////

//     function mintAndDepositCollateral(uint256 collateralSeed, uint256 amountCollateral) public {
//         amountCollateral = bound(amountCollateral, 0, MAX_DEPOSIT_SIZE);
//         ERC20Mock collateral = _getCollateralFromSeed(collateralSeed);
//         collateral.mint(msg.sender, amountCollateral);
//         nfre.depositCollateral(address(collateral), amountCollateral);
//     }

//     function redeemCollateral(uint256 collateralSeed, uint256 amountCollateral) public {
//         amountCollateral = bound(amountCollateral, 0, MAX_DEPOSIT_SIZE);
//         ERC20Mock collateral = _getCollateralFromSeed(collateralSeed);
//         nfre.redeemCollateral(address(collateral), amountCollateral);
//     }

//     function burnNfr(uint256 amountNfr) public {
//         amountNfr = bound(amountNfr, 0, nfr.balanceOf(msg.sender));
//         nfr.burn(amountNfr);
//     }

//     function mintNfr(uint256 amountNfr) public {
//         amountNfr = bound(amountNfr, 0, MAX_DEPOSIT_SIZE);
//         nfr.mint(msg.sender, amountNfr);
//     }

//     function liquidate(uint256 collateralSeed, address userToBeLiquidated, uint256 debtToCover) public {
//         ERC20Mock collateral = _getCollateralFromSeed(collateralSeed);
//         nfre.liquidate(address(collateral), userToBeLiquidated, debtToCover);
//     }

//     ////////////////////////////
//     /** @dev NeftyrStableCoin */
//     ////////////////////////////

//     function transfernfr(address to, uint256 amountNfr) public {
//         amountNfr = bound(amountNfr, 0, nfr.balanceOf(msg.sender));
//         vm.prank(msg.sender);
//         nfr.transfer(to, amountNfr);
//     }

//     //////////////////////
//     /** @dev Aggregator */
//     //////////////////////

//     function updateCollateralPrice(uint128 /* newPrice */, uint256 collateralSeed) public {
//         // int256 intNewPrice = int256(uint256(newPrice));
//         int256 intNewPrice = 0;
//         ERC20Mock collateral = _getCollateralFromSeed(collateralSeed);
//         MockV3Aggregator priceFeed = MockV3Aggregator(nfre.getCollateralTokenPriceFeed(address(collateral)));

//         priceFeed.updateAnswer(intNewPrice);
//     }

//     ////////////////////////////
//     /** @dev Helper Functions */
//     ////////////////////////////

//     function _getCollateralFromSeed(uint256 collateralSeed) private view returns (ERC20Mock) {
//         if (collateralSeed % 2 == 0) {
//             return weth;
//         } else {
//             return wbtc;
//         }
//     }

//     function callSummary() external view {
//         console.log("Weth total deposited", weth.balanceOf(address(nfre)));
//         console.log("Wbtc total deposited", wbtc.balanceOf(address(nfre)));
//         console.log("Total supply of nfr", nfr.totalSupply());
//     }
// }
