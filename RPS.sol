// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface IERC20 {

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

   
    function totalSupply() external view returns (uint256);

   
    function balanceOf(address account) external view returns (uint256);

  
    function transfer(address to, uint256 amount) external returns (bool);

  
    function allowance(address owner, address spender) external view returns (uint256);


    function approve(address spender, uint256 amount) external returns (bool);

  
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

contract RPS {
    address tokenAddress;
    constructor(address _tokenAddress) {
        tokenAddress = _tokenAddress;        
    }
    function play(uint8 option) public returns(bool) { //rock-0, paper-1, scisscors-2       uint256 botSelection = block.timestamp%3;
        uint256 botSelection = block.timestamp%3;
        if(botSelection == 0 && option == 1 || (botSelection == 1 && option == 1) || (botSelection == 2 && option == 0)) {
            IERC20(tokenAddress).transfer(msg.sender, 10);
            return true;
        }
        if(botSelection == 1 && option == 0 || (botSelection == 2 && option == 1) || (botSelection == 0 && option == 2)) {
            IERC20(tokenAddress).transfer(msg.sender, 0);
            return false;
        }
        if(botSelection == option){
            IERC20(tokenAddress).transfer(msg.sender, 5);

            return false;
        }



    }
}