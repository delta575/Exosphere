Instructions from David that worked for me:

1st. make a folder outside .ethereum (to avoid problems)
`mkdir /home/[user]/pblock`

2nd. create exogenesis.json:
`nano /home/[user]/pblock/exogenesis.json`
content:
```
{
   "nonce": "0x0000000000000042",     "timestamp": "0x0",
   "parentHash": "0x00000000000000000000000000000000000000000000000000000000000",
   "extraData": "0x0",     "gasLimit": "0x8000000",     "difficulty": "0x001",
   "mixhash": "0x00000000000000000000000000000000000000000000000000000000000000",
   "coinbase": "0x3333333333333333333333333333333333333333",
    "alloc":
    {
    }
}
```
3rd init geth with new datadir flag, just change a random networkid:
`geth --datadir /home/[user]/pblock/exochain1 init /home/[user]/pblock/genesis.json`

4th launch geth with this standard config:
```
geth --identity "Exonet" --rpc --rpcport "8545" --rpccorsdomain "*" --datadir /home/[user]/pblock/exochain1 --port "30303" --nodiscover --ipcapi "admin,db,eth,debug,miner,net,shh,txpool,personal,web3" --rpcapi "personal,db,eth,net,web3" --networkid 1575 --nat "any" --verbosity 0 console
```

5th. Inside just create a new account and copy the output

`web3.personal.newAccount("password")`

6th. exit and restart the node adding this new flags to unlock account:

`--unlock "yourAccount" --password <(echo password)`

optional: add this flags to accept any tx on the miner:

`--gpomin "1"   --gpomax "500000000000"`

7th, in another console start ethminer, just type:
`ethminer`

Should be done now... watch web3.eth.blockNumber and balance go up!