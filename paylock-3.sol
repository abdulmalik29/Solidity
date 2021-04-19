pragma solidity ^0.6.1;

contract myContract {
    
    enum State { Working, Completed, Delay, Done_1, Done_2, Forfeit}
    
    struct myStruct {
        uint disc; 
        State st;
    }
    myStruct Str;
    
    constructor() public {
    Str.st = State.Working;
    Str.disc = 0;
    }

    function signal() external {
    require( Str.st == State.Working );
    Str.st = State.Completed;
    Str.disc = 10;
    }
    
    function collect_1_Y() external {
    require( Str.st == State.Completed );
    Str.st = State.Done_1;
    Str.disc = 10;
    }
    
    function collect_1_N() external {
    require( Str.st == State.Completed );
    Str.st = State.Delay;
    Str.disc = 5;
    }
    
    function collect_2_Y() external {
    require( Str.st == State.Delay );
    Str.st = State.Done_2;
    Str.disc = 5;
    }
    
    function collect_2_N() external {
    require( Str.st == State.Delay );
    Str.st = State.Forfeit;
    Str.disc = 0;
    }
}
