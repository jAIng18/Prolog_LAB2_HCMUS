% Team
team(qatar).        
team(ecuador).      
team(senegal).     
team(netherlands).
team(england).     
team(iran).         
team(usa).         
team(wales).
team(argentina).    
team(saudi_arabia). 
team(mexico).      
team(poland).
team(france).       
team(australia).    
team(denmark).     
team(tunisia).
team(spain).        
team(costa_rica).   
team(germany).     
team(japan).
team(belgium).      
team(canada).       
team(morocco).     
team(croatia).
team(brazil).       
team(serbia).       
team(switzerland). 
team(cameroon).
team(portugal).     
team(ghana).        
team(uruguay).     
team(south_korea).

% Group Stage
group(qatar, a).        
group(ecuador, a).      
group(senegal, a).     
group(netherlands, a).
group(england, b).      
group(iran, b).         
group(usa, b).         
group(wales, b).
group(argentina, c).    
group(saudi_arabia, c). 
group(mexico, c).      
group(poland, c).
group(france, d).       
group(australia, d).    
group(denmark, d).     
group(tunisia, d).
group(spain, e).        
group(costa_rica, e).   
group(germany, e).     
group(japan, e).
group(belgium, f).      
group(canada, f).       
group(morocco, f).     
group(croatia, f).
group(brazil, g).      
group(serbia, g).       
group(switzerland, g). 
group(cameroon, g).
group(portugal, h).     
group(ghana, h).        
group(uruguay, h).     
group(south_korea, h).


% Group winner and runner-up
group_winner(a, netherlands).
group_winner(b, england).
group_winner(c, argentina).
group_winner(d, france).
group_winner(e, japan).
group_winner(f, morocco).
group_winner(g, brazil).
group_winner(h, portugal).

group_runner_up(a, senegal).
group_runner_up(b, usa).
group_runner_up(c, poland).
group_runner_up(d, australia).
group_runner_up(e, spain).
group_runner_up(f, croatia).
group_runner_up(g, switzerland).
group_runner_up(h, south_korea).

% Winner since round of 16
win(netherlands, usa).   
win(argentina, australia). 
win(france, poland).       
win(england, senegal).    
win(croatia, japan).      
win(brazil, south_korea).  
win(morocco, spain).       
win(portugal, switzerland).  

win(argentina, netherlands). 
win(france, england).         
win(croatia, brazil).         
win(morocco, portugal). 

win(argentina,croatia).    
win(france, morocco).       

win(argentina, france).    

% Round of 16
round_of_16_match(Team1, Team2) :-
    (group_winner(a, Team1), group_runner_up(b, Team2));
    (group_winner(a, Team2), group_runner_up(b, Team1)).

round_of_16_match(Team1, Team2) :-
    (group_winner(b, Team1), group_runner_up(a, Team2));
    (group_winner(b, Team2), group_runner_up(a, Team1)).

round_of_16_match(Team1, Team2) :-
    (group_winner(c, Team1), group_runner_up(d, Team2));
    (group_winner(c, Team2), group_runner_up(d, Team1)).

round_of_16_match(Team1, Team2) :-
    (group_winner(d, Team1), group_runner_up(c, Team2));
    (group_winner(d, Team2), group_runner_up(c, Team1)).

round_of_16_match(Team1, Team2) :-
    (group_winner(e, Team1), group_runner_up(f, Team2));
    (group_winner(e, Team2), group_runner_up(f, Team1)).

round_of_16_match(Team1, Team2) :-
    (group_winner(f, Team1), group_runner_up(e, Team2));
    (group_winner(f, Team2), group_runner_up(e, Team1)).

round_of_16_match(Team1, Team2) :-
    (group_winner(g, Team1), group_runner_up(h, Team2));
    (group_winner(g, Team2), group_runner_up(h, Team1)).

round_of_16_match(Team1, Team2) :-
    (group_winner(h, Team1), group_runner_up(g, Team2));
    (group_winner(h, Team2), group_runner_up(g, Team1)).

% qualified for quarterfinals
qualified_for_quarterfinals(Team) :-
    round_of_16_match(Team, X),
    win(Team, X).

% Quarterfinals
quarterfinals_match(Team1, Team2) :-
    qualified_for_quarterfinals(Team1),
    qualified_for_quarterfinals(Team2).

% qualified for semifinals
