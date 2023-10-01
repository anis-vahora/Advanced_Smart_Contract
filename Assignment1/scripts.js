const { ethers } = require("ethers");
const { abi: bridgeAbi } = require("./build/contracts/Bridge1.json");
const { abi: tokenAbi } = require("./build/contracts/ERC20Token1.json");

const provider = new ethers.JsonRpcProvider("http://127.0.0.1:7545");

async function sendTokens() {
  try {
    const wallet = new ethers.Wallet(
      "0x7d471dd804e0da233023ab6bdf0ed96a4144616379399601c4d4638089fb124e",
      provider
    );
    const bridgeContractAddress = "0x98120490323Fa0aa1A22A8859c842b66197fDD2F";
    const tokenContractAddress = "0x90beD2aeaED7C5BF1CD9d333Bb8Bb3899f2895ef";

    const token = new ethers.Contract(tokenContractAddress, tokenAbi, wallet);
    const bridge = new ethers.Contract(
      bridgeContractAddress,
      bridgeAbi,
      wallet
    );

    const numberOfTokensToApprove = 10000;
    const approveTx = await token.approve(
      bridgeContractAddress,
      numberOfTokensToApprove
    );
    console.log("Approval transaction sent:", approveTx.hash);
    await approveTx.wait();
    console.log("Tokens approved");

    const numberOfTokensToSend = 100;
    const tx = await bridge.sendToPolygon(numberOfTokensToSend, {
      gasLimit: 1000000,
    });
    console.log("Transaction sent:", tx.hash);

    await tx.wait();
    console.log("Tokens sent to Polygon network");
  } catch (error) {
    console.error("An error occurred:", error);
  }
}

sendTokens();
