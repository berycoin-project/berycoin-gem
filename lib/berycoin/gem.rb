require "berycoin/gem/version"
require 'net/http'
require 'uri'
require 'json'

class BerycoinRPC
  def initialize(service_url)
    @uri = URI.parse(service_url)
  end

  def method_missing(name, *args)
    post_body = { 'method' => name, 'params' => args, 'id' => 'jsonrpc' }.to_json
    resp = JSON.parse( http_post_request(post_body) )
    raise JSONRPCError, resp['error'] if resp['error']
    resp['result']
  end

  def http_post_request(post_body)
    http    = Net::HTTP.new(@uri.host, @uri.port)
    request = Net::HTTP::Post.new(@uri.request_uri)
    request.basic_auth @uri.user, @uri.password
    request.content_type = 'application/json'
    request.body = post_body
    http.request(request).body
  end

  class JSONRPCError < RuntimeError; end
end

module Berycoin
    RPCUSER = ENV['RPCUSER']
    RPCPASS = ENV['RPCPASS']
    RPCHOST = ENV['RPCHOST']
    RPCPORT = ENV['RPCPORT']
    LINK    = "http://" + RPCUSER + ":" + RPCPASS + "@" + RPCHOST + ":" + RPCPORT
    H = BerycoinRPC.new(LINK)

    module Blockchain
      
      def Blockchain.callcontract(address, data)
        H.callcontract(address,data)
      end
      
      def Blockchain.getaccountinfo(address)
        H.getaccountinfo address
      end

      def Blockchain.getnewaddress
        H.getnewaddress
      end

      def Blockchain.getbestblockhash
        H.getbestblockhash
      end

      def Blockchain.getblock(hash)
        H.getblock hash
      end

      def Blockchain.getblockchaininfo
        H.getblockchaininfo
      end
      def Blockchain.getblockcount
        H.getblockcount
      end
      def Blockchain.getblockhash(index)
        H.getblockhash(index)
      end
      def Blockchain.getblockheader(hash)
        H.getblockheader(hash)
      end
      def Blockchain.getchaintips
        H.getchaintips
      end
      def Blockchain.getchaintxstats(nBlocks)
        H.getchaintxstats nBlocks
      end
      def Blockchain.getdifficulty
        H.getdifficulty
      end
      def Blockchain.getmempoolancestors(txid)
        H.getmempoolancestors(txid)
      end
      def Blockchain.getmempooldescendants(txid)
        H.getmempooldescendants(txid)
      end
      def Blockchain.getmempoolentry(txid)
        H.getmempoolentry(txid)
      end
      def Blockchain.getmempoolinfo
        H.getmempoolinfo
      end
      def Blockchain.getrawmempool
        H.getrawmempool
      end
      def getstorage (address)
        H.getstorage address
      end
      def gettransactionreceipt(hash)
        H.gettransactionreceipt hash
      end
      def listcontracts 
        H.listcontracts
      end
      def preciousblock(blockhash)
        H.preciousblock blockhash
      end
      def pruneblockchain
        H.pruneblockchain
      end
      def searchlogs(from,to,address,topics)
        H.searchlogs from to address topics
      end
      def waitforlogs (fromBlock) (toBlock) (filter) (minconf)
        H.waitforlogs from to filter minconf
      end
      def Blockchain.gettxout(txid, n)
        H.gettxout(txid, n)
      end
      def Blockchain.gettxoutproof
        H.gettxoutproof
      end
      def Blockchain.gettxoutsetinfo
        H.gettxoutsetinfo
      end
      def Blockchain.verifychain
        H.verifychain
      end
      def Blockchain.verifytxoutproof(proof)
        H.verifytxoutproof(proof)
      end
    end
    module Control
      def Control.getinfo
        H.getinfo
      end
      def Control.getmemoryinfo
        H.getmemoryinfo
      end
      def Control.help
        H.help
      end
      def Control.stop
        H.stop
      end
      def Control.uptime
        H.uptime
      end
    end
    module Generating
      def Generating.generate(numblocks)
        H.generate(numblocks)
      end
      def Generating.generatetoaddress(numblocks, address)
        H.generatetoaddress(numblocks, address)
      end
    end
    module Mining
      def Mining.getblocktemplate
        H.getblocktemplate
      end
      def Mining.getmininginfo
        H.getmininginfo
      end
      def Mining.getnetworkhashps
        H.getnetworkhashps
      end
      def Mining.prioritisetransaction(*opt)
        H.prioritisetransaction (opt)
      end
      def Mining.getstakinginfo
        H.getstakinginfo
      end
      def Mining.getsubsidy(*nTarget)
        H.getsubsidy nTarget
      end  
      def Mining.submitblock(hexdata)
        H.submitblock(hexdata)
      end
    end
    module Network
      def Network.addnode(node, option)
        H.addnode(node, option)
      end
      def Network.clearbanned
        H.clearbanned
      end
      def Network.disconnectnode(node)
        H.disconnectnode(node)
      end
      def Network.getaddednodeinfo(dummy)
        H.getaddednodeinfo(dummy)
      end
      def Network.getconnectioncount
        H.getconnectioncount
      end
      def Network.getnettotals
        H.getnettotals
      end
      def Network.getnetworkinfo
        H.getnetworkinfo
      end
      def Network.getpeerinfo
        H.getpeerinfo
      end
      def Network.listbanned
        H.listbanned
      end
      def Network.ping
        H.ping
      end
      def Network.setban (ip, *opt)
        H.setban(ip, opt)
      end
      def Network.setnetworkactive(flag)
        H.setnetworkactive flag
      end
    end
    module RawTransactions
      def RawTransactions.combinerawtransaction(opt)
        H.combinerawtransaction opt
      end
      def RawTransactions.createrawtransaction(*opt)
        H.createrawtransaction(opt)
      end
      def RawTransactions.decoderawtransaction(hexstring)
        H.decoderawtransaction(hexstring)
      end
      def RawTransactions.decodescript(hex)
        H.decodescript(hex)
      end
      def RawTransactions.fundrawtransaction(hex)
        H.fundrawtransaction(hex)
      end
      def RawTransactions.fromhexaddress(hexaddress)
        H.fromhexaddress hexaddress
      end
      def RawTransactions.getrawtransaction(txid)
        H.getrawtransaction(txid)
      end
      def RawTransactions.gethexaddress(address)
        H.gethexaddress address
      end
      def RawTransactions.sendrawtransaction(hex)
        H.sendrawtransaction(hex)
      end
      def RawTransactions.signrawtransaction(hex)
        H.signrawtransaction(hex)
      end
    end
    module Util
      def Util.createmultisig(nrequired)
        H.createmultisig nrequired
      end
      def Util.estimatefee(nblocks)
        H.estimatefee nblocks
      end
      def Util.estimatepriority(nblocks)
        H.estimatepriority nblocks
      end
      def Util.estimatesmartfee(nblocks)
        H.estimatesmartfee nblocks
      end
      def Util.estimatesmartpriority(nblocks)
        H.estimatesmartpriority nblocks
      end
      def Util.signmessagewithprivkey(piv, msg)
        H.signmessagewithprivkey(piv, msg)
      end
      def Util.validateaddress(berycoinaddress)
        H.validateaddress berycoinaddress
      end
      def Util.verifymessage(berycoinaddress,signature,message)
        H.verifymessage(berycoinaddress,signature,message)
      end
    end
    module Wallet
      def Wallet.abandontransaction(txid)
        H.abandontransaction txid
      end
      def Wallet.abortrescan
        H.abortrescan
      end
      def Wallet.addmultisigaddress(*nrequired)
        H.addmultisigaddress nrequired
      end
      def Wallet.addwitnessaddress(address)
        H.addwitnessaddress address
      end
      def Wallet.backupwallet(destination)
        H.backupwallet destination
      end
      def Wallet.bumpfee(txid)
        H.bumpfee txid
      end
      def Wallet.createcontract(*bytecode)
        H.createcontract bytecode
      end
      def Wallet.dumpprivkey(berycoinaddress)
        H.dumpprivkey berycoinaddress
      end
      def Wallet.dumpwallet(filename)
        H.dumpwallet filename
      end
      def Wallet.encryptwallet(passphrase)
        H.encryptwallet passphrase
      end
      def Wallet.getaccount(berycoinaddress)
        H.getaccount berycoinaddress
      end
      def Wallet.getaccountaddress(account)
        H.getaccountaddress account
      end
      def Wallet.getaddressesbyaccount(account)
        H.getaddressesbyaccount(account)
      end
      def Wallet.getbalance(*account)
        H.getbalance account
      end
      def Wallet.getnewaddress(*account)
        H.getnewaddress account
      end
      def Wallet.getrawchangeaddress
        H.getrawchangeaddress
      end
      def Wallet.getreceivedbyaccount(account)
        H.getreceivedbyaccount account
      end
      def Wallet.getreceivedbyaddress(address)
        H.getreceivedbyaddress address
      end
      def Wallet.gettransaction(txid)
        H.gettransaction txid
      end
      def Wallet.getunconfirmedbalance
        H.getunconfirmedbalance
      end
      def Wallet.getwalletinfo
        H.getwalletinfo
      end
      def Wallet.importaddress(address)
        H.importaddress address
      end
      def importmulti(requests)
        H.importmulti requests
      end
      def Wallet.importprivkey(berycoinprivkey)
        H.importprivkey berycoinprivkey
      end
      def Wallet.importprunedfunds
        H.importprunedfunds
      end
      def Wallet.importpubkey(pubkey)
        H.importpubkey(pubkey)
      end
      def Wallet.importwallet(filename)
        H.importwallet(filename)
      end
      def Wallet.keypoolrefill
        H.keypoolrefill
      end
      def Wallet.listaccounts
        H.listaccounts
      end
      def Wallet.listaddressgroupings
        H.listaddressgroupings
      end
      def Wallet.listlockunspent
        H.listlockunspent
      end
      def Wallet.listreceivedbyaccount
        H.listreceivedbyaccount
      end
      def Wallet.listreceivedbyaddress
        H.listreceivedbyaddress
      end
      def Wallet.listsinceblock(*blockhash)
        H.listsinceblock blockhash
      end
      def Wallet.listtransactions(*account)
        H.listtransactions account
      end
      def Wallet.listwallets 
        H.listwallets
      end
      def Wallet.listunspent
        H.listunspent
      end
      def Wallet.lockunspent(unlock)
        H.lockunspent unlock
      end
      def Wallet.move(fromaccount,toaccount, amount)
        H.move(fromaccount, toaccount, amount)
      end
      def removeprunedfunds(txid)
        H.removeprunedfunds txid
      end
      def reservebalance(reserve,amount)
        H.reservebalance(reserve,amount)
      end
      def Wallet.sendfrom(fromaccount,toberycoinaddress,amount)
        H.sendfrom(fromaccount,toberycoinaddress,amount)
      end
      def Wallet.sendmany(fromaccount, json)
        H.sendmany(fromaccount, json)
      end
      def Wallet.sendmanywithdupes(*opt)
        H.sendmanywithdupes opt
      end
      def Wallet.sendtoaddress(berycoinaddress,amount)
        H.sendtoaddress(berycoinaddress,amount)
      end
      def sendtocontract (contractaddress,data)
        H.sendtocontract(contractaddress,data)
      end
      def setaccount(address,account)
        H.setaccount(address,account)
      end
      def walletlock
        H.walletlock
      end
      def walletpassphrase (passphrase, timeout)
        H.walletpassphrase (passphrase, timeout)
      end
      def walletpassphrasechange(oldpassphrase,newpassphrase)
        H.walletpassphrasechange (oldpassphrase, newpassphrase)
      end
      def Wallet.setaccount(berycoinaddress,account)
        H.setaccount(berycoinaddress,account)
      end
      def Wallet.settxfee(amount)
        H.settxfee amount
      end
      def Wallet.signmessage(berycoinaddress,message)
        H.signmessage(berycoinaddress,message)
      end
    end
end