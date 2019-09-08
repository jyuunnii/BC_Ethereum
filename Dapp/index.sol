pragma solidity ^0.5.10;

contract simpleVote{
    mapping(address => uint) private tickets;
    mapping(bytes32 => uint) private received_count; //문자열 담는 리스트

    uint private total_count;
    uint private sellable_count;
    uint private ticket_price;

    bytes32[] private itemNames;

    constructor(uint total, uint price) public {
        total_count = total;
        sellable_count = total;
        ticket_price = price;

        itemNames.push("Gomugomu");
        itemNames.push("Igeuliguel");
        itemNames.push("Dongkangdongkang");
        itemNames.push("susulsusul");
    }

    function buy() public payable { //metamask 와 연동 -> Payable
        uint count = msg.value / ticket_price;

        require (sellable_count >= count, "You don't have enough token!");

        tickets[msg.sender] += count;
        sellable_count -= count;
    }

    function vote(bytes32 item, uint count) public{
        bool check = existItem(item);

        require(tickets[msg.sender] >= count, "Error");

        received_count[item] += count;
        tickets[msg.sender] -= count;
    }

    function existItem(bytes32 item) public view returns (bool){
        for(uint i = 0; i < itemNames.length; i++){
            if(itemNames[i] == item){
                return true;
            }
        }
    }


    function getTicketsHave() public view returns (uint){
        return tickets[msg.sender];
    }
    
    function getTicketsReceive() public view returns (uint[]){
        
        uint[] temp;

        for(uint i = 0; i < itemNames.length; i++){
            temp.push(received_count[itemNames[i]]);
        }

        return temp;
    }

    function getTotalTicket() public view returns (uint)
    {
        return total_count;
    }


    function getSellabeTicket() public view returns (uint)
    {
        return sellable_count;
    }

    function getTicketPrice() public view returns (uint)
    {
        return ticket_price;
    }



    
}
