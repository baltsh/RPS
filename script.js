const  contractAirdropAddress = "0xf8e81D47203A594245E36C48e151709F0C19fBe8"
const contractAirdropABI = [
	{
		"inputs": [
			{
				"internalType": "uint8",
				"name": "option",
				"type": "uint8"
			}
		],
		"name": "play",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_tokenAddress",
				"type": "address"
			}
		],
		"stateMutability": "nonpayable",
		"type": "constructor"
	}
]
let signer
let contract
let log = `
    
    `;
const provider = new ethers.providers.Web3Provider(window.ethereum, 97)//BNBChain testnet chain_id 

provider.send("eth_requestAccounts",[]).then(() => {
        provider.listAccounts().then( (accounts) =>{
            signer = provider.getSigner(accounts[0]);
			console.log(signer)
            
            contract = new ethers.Contract(
                contractAirdropAddress,
                contractAirdropABI,
                signer
            )
        }
        )
    }
)

async function play(){
    let amountInEth = document.getElementById("amountInEth").value;
    let amountInWei = ethers.utils.parseEther(amountInEth.toString())
    //WEI = 10^(-18) in ETH
    let play = await contract.RPS({value: amountInWei});
    let res = await play.wait();
}