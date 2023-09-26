// total 17 fns. in all
pragma solidity >=0.6.2;

interface IUniswapV2Router01 {
    function factory() external pure returns (address); // returns address of Factory.sol

    function WETH() external pure returns (address); // returns address of WETH.sol

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

    // amountADesired: The amount of tokenA to add as liquidity...
    // if the B/A price is <= amountBDesired/amountADesired (A depreciates). ?

    // 2. WETH paired with any ERC20 token
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

    // 2. WETH paired with any ERC20 token
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);

    // 3. Sign/Approved + ERC20 Pair
    // approveMax	bool
    // Whether or not the approval amount in the signature is for liquidity or uint(-1)
    // v,r,s: components of permit-signature
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

    // 4. Sign/Approved + ETH and 1 ERC20
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

    // 1. ERC20 Pair: Input ExactTokens => amountOutMin, else revert
    // Swaps an exact amount of input tokens for as many output tokens as possible,...
    // along the route determined by the path...
    // The first element of path is the input token, the last is the output token,...
    // and any intermediate elements represent intermediate pairs to trade through...
    // (if, for example, a direct pair does not exist).

    // path: An array of token addresses. path.length must be >= 2...
    // Pools for each consecutive pair of addresses must exist and have liquidity.
    // deadline: Unix timestamp after which the transaction will revert.
    // return: amounts = The input token amount and all subsequent output token amounts.
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    // 2. ERC20 Pair: Ouput ExactTokens = amountInMax, else revert
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    // 2 fns. for "ExactETH"===================

    // 3. ETH+ERC20: Input ExactETH = amountOutMin, else revert
    // i/p ETH/WETH-> 1 arg. is less in fn. signature
    function swapExactETHForTokens(
        uint amountOutMin,
        address[] calldata path, // The first element of path must be WETH, the last is the output token
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);

    // 4. ETH+ERC20: Output ExactETH = amountInMax, else revert
    function swapTokensForExactETH(
        uint amountOut,
        uint amountInMax, // The first element of path is the input token, the last must be WETH,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    // 2 fns. for "ExactERC20"=================

    // 5. ETH+ERC20: Input ExactTokens = amountOutMin, else revert
    function swapExactTokensForETH(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    // 6. ETH+ERC20: Input ExactTokens, else revert
    // i/p ETH/WETH-> 1 arg. is less in fn. signature
    function swapETHForExactTokens(
        uint amountOut,
        address[] calldata path, // The first element of path must be WETH
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);

    // Given some asset amount and reserves, returns an amount of the other asset representing equivalent value.
    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);

    // 4 more getters (of amounts)

    // Given an input asset amount, returns the maximum output amount of the other asset (accounting for fees) given reserves.
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);

    // Returns the minimum input asset amount required to buy the given output asset amount (accounting for fees) given reserves.
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);

    // Given an input asset amount and an array of token addresses, calculates all subsequent maximum output token amounts...
    // by calling getReserves for each pair of token addresses in the path in turn, and using these to call getAmountOut.
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);

    // Given an output asset amount and an array of token addresses, calculates all preceding minimum input token amounts...
    // by calling getReserves for each pair of token addresses in the path in turn, and using these to call getAmountIn.
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}
