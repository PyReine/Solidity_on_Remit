pragma solidity 0.8.15;
contract BytesExample {
    bytes public myBytes="Hello World";
    string public myString="Hello World";
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
    function compareTwoStrings(string memory _myString) public view returns(bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }
    function getBytesLength() public view returns(uint) {
        return myBytes.length;
    }
}