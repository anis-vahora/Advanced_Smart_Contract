**Assignment 1**

![Screenshot 2023-10-01 152201](https://github.com/anis-vahora/Advanced_Smart_Contract/assets/58881736/c5de804c-3cb3-43db-bd0c-b0161787a3a0)

Explanation:
Truffle started compiling all the Solidity files in the contracts folder, as well as the OpenZeppelin contracts that contracts depend on. The compiled artifacts are stored in the build/contracts folder, and the process used Solidity compiler version 0.8.0. 


![Screenshot 2023-10-01 153457](https://github.com/anis-vahora/Advanced_Smart_Contract/assets/58881736/c7fad7f1-4979-45c4-b0d7-ec5f0b792690)
![Screenshot 2023-10-01 153918](https://github.com/anis-vahora/Advanced_Smart_Contract/assets/58881736/bdcdc080-b23a-4a2c-b754-398dc2ba2582)
![Screenshot 2023-10-01 154221](https://github.com/anis-vahora/Advanced_Smart_Contract/assets/58881736/8598b20b-7232-4135-a1d1-83f8005b8989)
![Screenshot 2023-10-01 153742](https://github.com/anis-vahora/Advanced_Smart_Contract/assets/58881736/c0b3ea99-1d88-468e-9e83-bf432f994df5)


Explanation:
I ran truffle migrate to deploy my smart contracts onto my local Ethereum blockchain provided by Ganache. The compilation and deployment of four contracts (two ERC20 tokens and two bridge contracts) were successful. Each contract deployment provided details like the transaction hash, the contract address, my account used, and the gas cost in ETH. All the deployment details were logged, and the artifacts were updated in the build/contracts folder. The total cost for deploying all contracts was 0.009398362573998017 ETH.

Also the ganache account shows that the amount has been reduced from the original value.


![Screenshot 2023-10-01 154318](https://github.com/anis-vahora/Advanced_Smart_Contract/assets/58881736/f6dead4d-c042-40dd-a07e-c6129dded627)


Explanation: 
I ran truffle test to execute my unit tests for the contracts on the local development network. The contracts were compiled successfully, and the tests were executed. The results indicate that the test case for the "Bridge1" contract passed. Specifically, the test confirmed that tokens can be sent to the bridge contract successfully. The test execution was quick, and all the detailed outputs, including the compilation and test results, were displayed in the terminal. Now, I have verified through testing that the token sending functionality to the bridge contract is working as expected.
