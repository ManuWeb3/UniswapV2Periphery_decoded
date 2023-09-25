// total 17 fns. in all
pragma solidity >=0.6.2;

interface IUniswapV2Router01 {
    function factory() external pure returns (address); // returns address of Factory.sol

    function WETH() external pure returns (address); // returns address of Factory.sol

    // 2 addLiquidity() functions================================

    // 1. Pair of ERC20 tokens
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);

    // 2. ETH paired with any ERC20 token
    function addLiquidityETH(
        address token, // only 1 ERC20 token is req. then with ETH
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);

    // 4 removeLiquidity() functions================================

    // 1. Pair of ERC20 tokens
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);

    // 2. ETH paired with any ERC20 token
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);

    // 3. Sign + ERC20 Pair
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint amountA, uint amountB);

    // 4. Sign + ETH and 1 ERC20
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint amountToken, uint amountETH);

    // 6 fns. for swap()=================================

    // 1. ERC20 Pair: Ouput ExactTokens = amountOutMin, for any no. of Input tokens that I have
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin, // what's to do with OutMin/InMax ??
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts); // return ??

    // 2. ERC20 Pair: Input ExactTokens = amountInMax, for any no. of Output tokens that I'll get
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    // 2 fns. for "ExactETH"===================

    // 3. ETH+ERC20: Ouput ExactETH = amountOutMin, for any no. of Input ERC20 tokens that I have
    function swapExactETHForTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);

    // 4. ETH+ERC20: Input ExactETH = amountInMax, for any no. of Output ERC20 tokens that I'll get
    function swapTokensForExactETH(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    // 2 fns. for "ExactERC20"=================

    // 5. ETH+ERC20: Ouput ExactTokens = amountOutMin, for any no. of Input ETH that I have
    function swapExactTokensForETH(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    // 6. ETH+ERC20: Input ExactTokens, for any no. of Output ETH that I'll get
    function swapETHForExactTokens(
        uint amountOut,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);

    // 4 more getters (of amounts)

    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);

    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);

    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);

    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}
