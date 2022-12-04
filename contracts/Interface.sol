// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

interface IFlashLoanRecipient {
  function receiveFlashLoan(
    IERC20[] memory tokens,
    uint256[] memory amounts,
    uint256[] memory feeAmounts,
    bytes memory userData
  ) external;
}

interface IERC20 {
  event Approval(address indexed owner, address indexed spender, uint256 value);
  event Transfer(address indexed from, address indexed to, uint256 value);

  function name() external view returns (string memory);

  function symbol() external view returns (string memory);

  function decimals() external view returns (uint8);

  function totalSupply() external view returns (uint256);

  function balanceOf(address owner) external view returns (uint256);

  function allowance(address owner, address spender)
  external
  view
  returns (uint256);

  function approve(address spender, uint256 value) external returns (bool);

  function transfer(address to, uint256 value) external returns (bool);

  function transferFrom(
    address from,
    address to,
    uint256 value
  ) external returns (bool);
  function withdraw(uint256 wad) external;
  function deposit(uint256 wad) external returns (bool);
  function owner() external view virtual returns (address);
}

interface ICEtherDelegate {
  function borrow(uint256 borrowAmount) external returns (uint256);

  function getCash() external view returns (uint256);

  function mint() external payable;

  function balanceOf(address account) external view returns (uint256);

  function transfer(address dst, uint256 amount) external returns (bool);

  function transferFrom(
    address src,
    address dst,
    uint256 amount
  ) external returns (bool);

  function underlying() external view returns (address);
}

interface ICErc20Delegate {
  event AccrueInterest(
    uint256 cashPrior,
    uint256 interestAccumulated,
    uint256 borrowIndex,
    uint256 totalBorrows
  );
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 amount
  );
  event Borrow(
    address borrower,
    uint256 borrowAmount,
    uint256 accountBorrows,
    uint256 totalBorrows
  );
  event Failure(uint256 error, uint256 info, uint256 detail);
  event LiquidateBorrow(
    address liquidator,
    address borrower,
    uint256 repayAmount,
    address cTokenCollateral,
    uint256 seizeTokens
  );
  event Mint(address minter, uint256 mintAmount, uint256 mintTokens);
  event NewAdmin(address oldAdmin, address newAdmin);
  event NewComptroller(address oldComptroller, address newComptroller);
  event NewMarketInterestRateModel(
    address oldInterestRateModel,
    address newInterestRateModel
  );
  event NewPendingAdmin(address oldPendingAdmin, address newPendingAdmin);
  event NewReserveFactor(
    uint256 oldReserveFactorMantissa,
    uint256 newReserveFactorMantissa
  );
  event Redeem(address redeemer, uint256 redeemAmount, uint256 redeemTokens);
  event RepayBorrow(
    address payer,
    address borrower,
    uint256 repayAmount,
    uint256 accountBorrows,
    uint256 totalBorrows
  );
  event ReservesAdded(
    address benefactor,
    uint256 addAmount,
    uint256 newTotalReserves
  );
  event ReservesReduced(
    address admin,
    uint256 reduceAmount,
    uint256 newTotalReserves
  );
  event Transfer(address indexed from, address indexed to, uint256 amount);

  function _acceptAdmin() external returns (uint256);

  function _addReserves(uint256 addAmount) external returns (uint256);

  function _becomeImplementation(bytes memory data) external;

  function _delegateCompLikeTo(address compLikeDelegatee) external;

  function _reduceReserves(uint256 reduceAmount) external returns (uint256);

  function _resignImplementation() external;

  function _setComptroller(address newComptroller) external returns (uint256);

  function _setInterestRateModel(address newInterestRateModel)
  external
  returns (uint256);

  function _setPendingAdmin(address newPendingAdmin) external returns (uint256);

  function _setReserveFactor(uint256 newReserveFactorMantissa)
  external
  returns (uint256);

  function accrualBlockNumber() external view returns (uint256);

  function accrueInterest() external returns (uint256);

  function admin() external view returns (address);

  function allowance(address owner, address spender)
  external
  view
  returns (uint256);

  function approve(address spender, uint256 amount) external returns (bool);

  function balanceOf(address owner) external view returns (uint256);

  function balanceOfUnderlying(address owner) external returns (uint256);

  function borrow(uint256 borrowAmount) external returns (uint256);

  function borrowBalanceCurrent(address account) external returns (uint256);

  function borrowBalanceStored(address account) external view returns (uint256);

  function borrowIndex() external view returns (uint256);

  function borrowRatePerBlock() external view returns (uint256);

  function comptroller() external view returns (address);

  function decimals() external view returns (uint8);

  function exchangeRateCurrent() external returns (uint256);

  function exchangeRateStored() external view returns (uint256);

  function getAccountSnapshot(address account)
  external
  view
  returns (
    uint256,
    uint256,
    uint256,
    uint256
  );

  function getCash() external view returns (uint256);

  function implementation() external view returns (address);

  function initialize(
    address underlying_,
    address comptroller_,
    address interestRateModel_,
    uint256 initialExchangeRateMantissa_,
    string memory name_,
    string memory symbol_,
    uint8 decimals_
  ) external;

  function initialize(
    address comptroller_,
    address interestRateModel_,
    uint256 initialExchangeRateMantissa_,
    string memory name_,
    string memory symbol_,
    uint8 decimals_
  ) external;

  function interestRateModel() external view returns (address);

  function isCToken() external view returns (bool);

  function liquidateBorrow(
    address borrower,
    uint256 repayAmount,
    address cTokenCollateral
  ) external returns (uint256);

  function mint(uint256 mintAmount) external returns (uint256);

  function name() external view returns (string memory);

  function pendingAdmin() external view returns (address);

  function protocolSeizeShareMantissa() external view returns (uint256);

  function redeem(uint256 redeemTokens) external returns (uint256);

  function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

  function repayBorrow(uint256 repayAmount) external returns (uint256);

  function repayBorrowBehalf(address borrower, uint256 repayAmount)
  external
  returns (uint256);

  function reserveFactorMantissa() external view returns (uint256);

  function seize(
    address liquidator,
    address borrower,
    uint256 seizeTokens
  ) external returns (uint256);

  function supplyRatePerBlock() external view returns (uint256);

  function sweepToken(address token) external;

  function symbol() external view returns (string memory);

  function totalBorrows() external view returns (uint256);

  function totalBorrowsCurrent() external returns (uint256);

  function totalReserves() external view returns (uint256);

  function totalSupply() external view returns (uint256);

  function transfer(address dst, uint256 amount) external returns (bool);

  function transferFrom(
    address src,
    address dst,
    uint256 amount
  ) external returns (bool);

  function underlying() external view returns (address);
}

interface IUnitroller {
  function enterMarkets(address[] memory cTokens)
  external
  returns (uint256[] memory);

  function exitMarket(address cTokenAddress) external returns (uint256);

  function cTokensByUnderlying(address) external view returns (address);

  function getAccountLiquidity(address account)
  external
  view
  returns (
    uint256,
    uint256,
    uint256
  );

  function borrowCaps(address) external view returns (uint256);
  function getAllMarkets() external view returns (address[] memory);
}

interface IBalancerVault {
  function flashLoan(
    address recipient,
    address[] memory tokens,
    uint256[] memory amounts,
    bytes memory userData
  ) external;
}