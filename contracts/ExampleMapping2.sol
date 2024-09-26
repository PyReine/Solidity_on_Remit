pragma solidity 0.8.15;
contract ExampleMappingWithdrawals {
    
// limit the withdrawl to the deposit by user using mapping
    mapping(address => uint) public balanceReceived;

    function sendMondy() public payable{
        balanceReceived[msg.sender] +=msg.value;
    }
    function getBalance() public view returns(uint){
        return address(this).balance;

    }
 //   //function withdrawAllMoney(address payable _to) public {
 //   //    _to.transfer(getBalance());
 //   function withdrawAllMoney(address payable _to) public {
 //       _to.transfer(balanceReceived[msg.sender]);
 //       balanceReceived[msg.sender]=0;
    // above would be a valid thing, but here we would open it up to a sort of re entrance attack and it's,
//not really possible with the transfer function because it only gives you a minimum amount of gas.
//this is called the checks effects interactions pattern.
//what you should do is first check if the user has enough balance.
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSendOut=balanceReceived[msg.sender];
        balanceReceived[msg.sender]=0;
        _to.transfer(balanceToSendOut);
    }
}