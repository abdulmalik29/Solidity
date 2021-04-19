pragma solidity ^0.6.1;

contract myContract {
    
    enum State { Working, Completed, Delay, Done_1, Done_2, Forfeit}
    
    struct myStruct {
        uint disc; 
        State st;
        int clock;
        address timeAdd;
        int deadline;
    }
    myStruct Str;
    
    event log(address sender, uint disc, State st, int clock);
    
    constructor() public {
    Str.st = State.Working;
    Str.disc = 0;
    Str.clock = 0;
    Str.deadline = 4;
    Str.timeAdd = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    }

    function tick() external {
    require(Str.timeAdd == msg.sender);
    if (Str.clock == Str.deadline){
        emit log(msg.sender, Str.disc, Str.st, Str.clock);
    }
    else{
        Str.clock++;
      }
    }
    
    function signal() external {
    require( Str.st == State.Working );
    Str.st = State.Completed;
    Str.disc = 10;
    
    emit log(msg.sender, Str.disc, Str.st, Str.clock);
    }
    
    function collect_1_Y() external {
    require( Str.st == State.Completed );
    Str.st = State.Done_1;
    Str.disc = 10;

    emit log(msg.sender, Str.disc, Str.st, Str.clock);

    }
    
    function collect_1_N() external {
    require( Str.st == State.Completed );
    Str.st = State.Delay;
    Str.disc = 5;
    
    emit log(msg.sender, Str.disc, Str.st, Str.clock);
    }
    
    function collect_2_Y() external {
    require( Str.st == State.Delay );
    Str.st = State.Done_2;
    Str.disc = 5;
    
    emit log(msg.sender, Str.disc, Str.st, Str.clock);
    }
    
    function collect_2_N() external {
    require( Str.st == State.Delay );
    Str.st = State.Forfeit;
    Str.disc = 0;
    
    emit log(msg.sender, Str.disc, Str.st, Str.clock);
    }
}
