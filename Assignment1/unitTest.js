const Bridge1 = artifacts.require("Bridge1");
const ERC20Token1 = artifacts.require("ERC20Token1");

contract("Bridge1", (accounts) => {
  let bridge1, erc20Token1;

  beforeEach(async () => {
    erc20Token1 = await ERC20Token1.new(1000000);
    bridge1 = await Bridge1.new(erc20Token1.address);
  });

  it("should send tokens to bridge contract", async () => {
    await erc20Token1.approve(bridge1.address, 500, { from: accounts[0] });
    await bridge1.sendToPolygon(500, { from: accounts[0] });
    const bridgeBalance = await erc20Token1.balanceOf(bridge1.address);
    assert.equal(bridgeBalance.toString(), "500");
  });
});
