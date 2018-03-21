pragma solidity ^0.4.16;

contract SystemeVote_Hotel {
    
    // VARIABLES
    address public owner;
    uint ID_hotel = 700745;
    uint public nbofvote;
    uint public gradeof;
    string  public commentof;
    string erreur="Erreur, veuillez entrer un index correct";
    
    //Struct
    struct Vote {
        uint grade;
        address Voter_address;
        string comment;
    }
    
    Vote[] public Votes;
    //Modifier
     modifier isGoodGrade(uint grade) {
        if(grade > 10 ) throw;
        if(grade<0) throw;
        _;
    }
    
   modifier isowner(){
       if(msg.sender!=owner){throw;
       _;
       }
   }

    //function      
    
    function SystemeVote_Hotel() {
        owner = msg.sender;
    }
    
    function PostVote (string comment_,uint grade_) public isGoodGrade(grade_)  {
        Votes.push( Vote({
                    Voter_address : msg.sender,
                    grade : grade_,
                    comment : comment_
                        })
                    );
        uint number_of_vote = 0;
        for(uint i = 0 ;i < Votes.length; i++)
        {
                number_of_vote++;
        }
        nbofvote = number_of_vote;

    }
    
    function GetGradeandComment(uint index) {
        
        string commentaire;
        uint note;
        
                if(index<Votes.length)
                {
                    if(index>=0)
                    {
                    commentaire=Votes[index].comment;
                    note=Votes[index].grade;
                    }
                }
                
                if(index>=Votes.length)
                {
                    commentaire=erreur;
                    note=0;
                    
                }
                
                if(index<0)
                {
                    commentaire=erreur;
                    note=0;
                    
                }
                
                
        gradeof=note;
        commentof=commentaire;
    }
        
    // KILL
    function kill() isowner(){
           delete owner;
           delete ID_hotel;
           selfdestruct(msg.sender);
       }
}
