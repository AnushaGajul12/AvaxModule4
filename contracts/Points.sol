// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Points is ERC20, Ownable {
    struct Prize {
        string prizeName;
        uint256 cost;
    }

    Prize[] public prizes;

    constructor() ERC20("Degen", "DGN") {
        prizes.push(Prize("PrizeA", 100));
        prizes.push(Prize("PrizeB", 200));
    }

    event PrizeRedeemed(address user, string prize);

    function redeemTokens(uint256 _value, uint256 prizeIndex) external {
        require(balanceOf(msg.sender) >= _value, "You dont have enough tokens");
        require(prizeIndex < prizes.length, "Invalid prize index");

        Prize storage selectedPrize = prizes[prizeIndex];

        require(_value >= selectedPrize.cost,"Insufficient tokens to redeem the prize");
        
        _transfer(msg.sender, address(this), selectedPrize.cost);
        emit PrizeRedeemed(msg.sender, selectedPrize.prizeName);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender); 
    }

    function transferTokens(address _rec, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You dont have enough tokens");
        _transfer(msg.sender, _rec, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value,"You dont have enough tokens to burn");
        _burn(msg.sender, _value);
    }
}
