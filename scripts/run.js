const main = async () => {
    // Compile our file and generate the necessary file under `artifacts` directory.
    const nftContractFactory = await hre.ethers.getContractFactory('MyEpicNFT');
    
    // Hardhat will create LOCAL ethereum network, but just for THIS contract.
    // After script completes it will DESTROY that local ethereum network.
    const nftContract = await nftContractFactory.deploy();
    
    // Wait until the contract is officially mined and deployed to our blockchain.
    // Hardhat actually create fakers `miners` on your machine to imitate the actual blockchain.
    await nftContract.deployed();
    console.log("Contract deployed to:", nftContract.address);
}

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();
