contract Registry { 
    mapping (address => string) public nameOf;
    address creator;


    function Registry(string _name) {
        creator = msg.sender;
        nameOf[msg.sender] = _name;
    }    

    function newReg(address _add, string _name) {

        nameOf[_add] = _name;        

    }
    function getReg(address _add) constant returns(string){

        return nameOf[_add];

    }
    
    function kill()
    {
        if (msg.sender == creator)
            suicide(creator);  
    }
}
