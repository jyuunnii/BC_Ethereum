# Block Chain Ethereum Running Process
# Mac OS

- Install homebrew & Geth

- Set Environment Variable

  vi .eth_profile  -> create or modify!
  
  export ETH=/Users/jiyunpark/BC_Ethereum/myeth/go-ethereum
  
  export PATH=${PATH}:$ETH/build/bin:
  
  source .eth_profile   -> apply!
  
  geth version > GOROOT=    -> check!
  
 
- Geth version
  cd go-ethereum/build/bin
  geth version

  ### Geth version 1.9.2
  ### Go version go1.12.7
  
- Log in  

  geth --networkid "4649" --nodiscover --datadir ./ --unlock 0,1 --password ./password --allow-insecure-unlock --rpc --rpcaddr "127.0.0.1" --rpcport "8545" --rpccorsdomain "*" --rpcapi "eth,net,web3,personal" console 2>> ./geth.log

- Transfer

  personal.unlockAccount(eth.accounts[0])
  
  Password
  
  eth.sendTransaction({from:eth.accounts[0],to:eth.accounts[1],value:web3.toWei(10,'ether')})
  
