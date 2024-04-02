//pragma solidity ^0.8.21; //버전
pragma solidity >=0.4.22 <0.9.0;

contract HelloWorld {
    string public value;    //상태 변수

    // 고양이 정보를 저장할 변수
    string public catName = "kitty";

    constructor() {
        value = 'hello world!';
    }
    // 인스턴스에 있는 상태변수를 바꾸는 함수
    function setValue(string memory _v) public {
        value =_v;
    }
    
    function x() public view returns(uint256){
        uint256 z = uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp, msg.sender))) % 6 + 1; // 블록 해시를 통해 무작위성을 얻음
        return (z);
    }
    
    // 고양이 정보를 반환하는 함수
    function getCat() public view returns (string memory) {
        return (catName);
    }    

    // 이더를 전송할 함수
    function transferEther(address _sender, address _receiver) external payable {
        // 메시지 전송자(호출한 계정)가 함수 호출 시 지정한 _sender와 일치하는지 확인합니다.
        require(msg.sender == _sender, "Only the sender can initiate this transfer.");
        
        // 이더를 전송합니다. _receiver에게 1 이더를 전송합니다.
        payable(_receiver).transfer(1 ether);
    }    
}