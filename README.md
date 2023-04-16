# UpgradeableSmartContracts
try simple upgradeable smart contracts(a simple demo for wealth management)

quick test in Remix IDE:

1.Deploy Logic1.sol ,Logic2.sol with whichever account

2.Deploy the proxy contract 'Update.sol' 

   2.1 with customer account(say account1) 
   2.2 put in some Ethers during deployment(say 50 Ethers)
   2.3 and pass the deployment address of Logic1.sol as the argument 

3.Use the company address(I specify to 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2) for testing.

  3.1 call transferToWealthNavig() for the first time, it will transfer the inital investment (=50 ETHs * 10 % =5 ETHs) to company address.
  
  3.2 next, (suppose the company did a good job this month and the customer is happy to keep the logic of Logic1 which is increase the rate by 3%) call delegate function fallback() to by clicking calldata with 0xd09de08a(selector of increment()) as the argument to update the newest investment proportion to 13%, then call transferToWealthNavig(), company will get current  balance * 13% ETHs

  3.3 (suppose next month the return value is low or even lost some money, the customer wants to switch to Logic2.sol which is lower the investment) switch to account1 and call function update() to switch to Logic2.sol by passing deployment address of Logic2.sol as the argument. Now repeat steps in 3.2, investment proportion for this month will get back to 10%.

We may try more e.g. Time lock, or logic contracts like suspend investment, bonus rate, automaticlly distribute commission fee, etc. 
