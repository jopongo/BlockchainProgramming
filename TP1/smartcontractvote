pragma solidity ^0.4.18;


contract SystemeVote{
    
    address owner;
    
    //MODIFIER
    modifier isowner() {
        if(msg.sender!=owner){throw;
        _;
        }
    }

    //VARIABLES
    mapping(address => uint) public liste_Electeurs;
    
    mapping(address=> uint) public liste_Candidats;
    
    
    //CONSTRUCTEURS
    function SystemeVote(address[] candidats,address[] electeurs)public isowner(){
        
        owner=msg.sender; //Le owner c'est celui qui lance le smart contract
        liste_Electeurs[owner]=1;
        
        
        
        for(uint i=0; i<candidats.length;i++)
        {
            RecordCandidat(candidats[i]);
            RecordElecteur(electeurs[i]);
        }

    }
    
    //FONCTIONS
    function RecordCandidat(address Candidat) public{
        liste_Candidats[Candidat]=0;
        
    }
    
    function RecordElecteur(address Electeur) public{
        liste_Electeurs[Electeur]=1;
        
    }
    
    function vote (address Votant, address VotePour ) public
    {
        if(liste_Electeurs[Votant]>0)
        {
            liste_Electeurs[Votant]--;
            liste_Candidats[VotePour]++;
        }
        else
        {
            throw;
        }
    }
    
    function Winner(address[] candidats) public returns(address gagnant)
    {
        uint max=0;
        for(uint p=0; p<candidats.length;p++)
        {
            if(liste_Candidats[candidats[p]]<max)
            {
                max=liste_Candidats[candidats[p]];
                gagnant=candidats[p];
            }
        }
    }
    
    function kill() isowner() public{
        delete owner;
        selfdestruct(msg.sender);
    }
}




//Inscrire Votant
//Inscrire Proposition
//Voter 
//Donner le résultat
