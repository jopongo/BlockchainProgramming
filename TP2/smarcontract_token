pragma solidity ^0.4.18;

import './EIP20Interface.sol';
import './SafeMath.sol';

contract Cellscoin is EIP20Interface {
    
    using SafeMath for uint256;
    
    uint public constant _totalsupply = 1000000000000000000;
    

    //Propriétés du token
    uint public constant RATE = 20;//1 ether = 20 Cc
    string public constant symbol ="CsC";
    string public constant name ="Cellscoin";
    uint public constant decimals = 18;
    
    
    mapping(address=>uint256) balances;
    mapping(address=>mapping(address=>uint256)) allowed;
    
    function Cellscoin (uint _end, uint _amountToRaise)public{
        balances[msg.sender]=_totalsupply;
    }    
    
    function totalSupply() public constant returns (uint256 totalSupply){
        return _totalsupply;
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance){
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success){
        require(
            balances[msg.sender] >= _value
            && _value>0
            );
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        Transfer(msg.sender,_to,_value);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(
            allowed[_from][msg.sender]>=_value
            &&balances[_from]>=_value
            &&_value>0
            );
        balances[_from]=balances[_from].sub(_value);
        balances[_to]=balances[_to].add(_value);
        allowed[_from][msg.sender]=allowed[_from][msg.sender].sub(_value);
        Transfer(_from,_to,_value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success){
        allowed[msg.sender][_spender]=_value;
        Approval(msg.sender,_spender,_value);
        return true;
        
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return allowed[_owner][_spender];
    }
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value); 
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    

}

