:- style_check(-singleton).

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
win_of_16(netherlands, usa).   
win_of_16(argentina, australia). 
win_of_16(france, poland).       
win_of_16(england, senegal).    
win_of_16(croatia, japan).      
win_of_16(brazil, south_korea).  
win_of_16(morocco, spain).       
win_of_16(portugal, switzerland).  

win_of_quarter(argentina, netherlands). 
win_of_quarter(france, england).         
win_of_quarter(croatia, brazil).         
win_of_quarter(morocco, portugal). 

win_of_semi(argentina,croatia).    
win_of_semi(france, morocco).       

win_of_final(argentina, france).    
win_of_3rd(croatia, morocco).

% penalty
penalty(croatia, japan).
penalty(morocco, spain).

penalty(argentina, netherlands).
penalty(croatia, brazil).

penalty(argentina, france).

% count penalty
count_penalty(Team):-
    findall(Team, (penalty(Team, _); penalty(_, Team)), Teams),
    length(Teams, Count),
    format('Total penalty: ~w', [Count]).

% teams in a group
teams_in_group(Group, Teams) :-
    findall(Team, group(Team, Group), Teams).

% qualified from group stage
qualified_from_group(Group, Team1, Team2) :-
    group_winner(Group, Team1);
    group_runner_up(Group, Team2).

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
    win_of_16(Team, X).

% Quarterfinals
possible_quarterfinals_match(Team1, Team2) :-
    qualified_for_quarterfinals(Team1),
    qualified_for_quarterfinals(Team2),
    Team1 \= Team2.

% qualified for semifinals
qualified_for_semifinals(Team) :-
    possible_quarterfinals_match(Team, X),
    win_of_quarter(Team, X).

% Semifinals
possible_semifinals_match(Team1, Team2) :-
    qualified_for_semifinals(Team1),
    qualified_for_semifinals(Team2),
    Team1 \= Team2.

% qualified for final
qualified_for_final(Team) :-
    possible_semifinals_match(Team, X),
    win_of_semi(Team, X).

% Final
final_match(Team1, Team2) :-
    qualified_for_final(Team1),
    qualified_for_final(Team2),
    Team1 \= Team2.

champion(Team) :-
    final_match(Team, _),
    win_of_final(Team, _).

% Eliminated in each stage
eliminated_in_groupstage(Team) :-
    group(Team, X),
    \+ group_winner(X, Team),
    \+ group_runner_up(X, Team).

eliminated_in_round_of_16(Team) :-
    round_of_16_match(Team, Opponent),
    \+ win_of_16(Team, Opponent).

eliminated_in_quarterfinals(Team) :-
    qualified_for_quarterfinals(Team),
    possible_quarterfinals_match(Team, Opponent),
    \+ win_of_quarter(Team, Opponent),
    win_of_quarter(Opponent, Team).

eliminated_in_semifinals(Team) :-
    qualified_for_semifinals(Team),
    possible_semifinals_match(Team, Opponent),
    \+ win_of_semi(Team, Opponent),
    win_of_semi(Opponent, Team).

lose_final(Team) :-
    final_match(Team, Opponent),
    \+ win_of_final(Team, Opponent).

runner_up(Team):-
    lose_final(Team).

place_3rd(Team) :-
    win_of_3rd(Team, _).

play_against(Team1, Team2) :-
    round_of_16_match(Team1, Team2);
    (possible_quarterfinals_match(Team1, Team2),(win_of_quarter(Team1, Team2); win_of_quarter(Team2, Team1)));
    (possible_semifinals_match(Team1, Team2),(win_of_semi(Team1, Team2); win_of_semi(Team2, Team1)));
    final_match(Team1, Team2).

teams_defeated_by(Team, DefeatedTeams) :-
    findall(Opponent, (
        (win_of_16(Team, Opponent);
         win_of_quarter(Team, Opponent);
         win_of_semi(Team, Opponent);
         win_of_final(Team, Opponent))
    ), DefeatedTeams).


% Test 1: team
% 1/ Is Qatar a team in the tournament?
?- team(qatar). % True
% 2/ Is Brazil a team in the tournament?
?- team(brazil). % True
% 3/ Is Italy a team in the tournament?
?- team(italy). % False

% Test 2: group
% 1/ What group is Qatar in?
?- group(qatar, Group). % Group = a.
% 2/ What group is Brazil in?
?- group(brazil, Group). % Group = g.
% 3/ Is Argentina in group C?
?- group(argentina, c). % True

% Test 3: group_winner
% 1/ Who is the winner of group A?
?- group_winner(a, Winner). % Winner = netherlands.
% 2/ Is Netherlands the winner of group A?
?- group_winner(a, netherlands). % True
% 3/ Who won group F?
?- group_winner(f, Winner). % Winner = morocco.

% Test 4: group_runner_up
% 1/ Who is the runner-up of group A?
?- group_runner_up(a, RunnerUp). % RunnerUp = senegal.
% 2/ Is Senegal the runner-up of group A?
?- group_runner_up(a, senegal). % True
% 3/ Who is the runner-up of group G?
?- group_runner_up(g, RunnerUp). % RunnerUp = switzerland.

% Test 5: win_of_16
% 1/ Did Netherlands win against USA in Round of 16?
?- win_of_16(netherlands, usa). % True
% 2/ Did Argentina win against England in Round of 16?
?- win_of_16(argentina, england). % False
% 3/ Which team did Brazil win against in Round of 16?
?- win_of_16(brazil, X). % X = south_korea.

% Test 6: win_of_quarter
% 1/ Did Brazil win against Argentina in the quarterfinals?
?- win_of_quarter(brazil, argentina). % False
% 2/ Did Italy win against France in the quarterfinals?
?- win_of_quarter(italy, france). % False
% 3/ Which team did Brazil win against in the quarterfinals?
?- win_of_quarter(brazil, X). % False

% Test 7: win_of_semi
% 1/ Did Brazil win against Italy in the semifinals?
?- win_of_semi(brazil, italy). % False
% 2/ Did Argentina win against Netherlands in the semifinals?
?- win_of_semi(argentina, netherlands). % False
% 3/ Which team did France win against in the semifinals?
?- win_of_semi(france, X). % X = morocco.

% Test 8: win_of_final
% 1/ Did Brazil win against Argentina in the final?
?- win_of_final(brazil, argentina). % False
% 2/ Did Italy win against France in the final?
?- win_of_final(italy, france). % False
% 3/ Which team won against France in the final?
?- win_of_final(X, france). % X = argentina.

% Test 9: win_of_3rd
% 1/ Did Italy win against Netherlands in the 3rd place match?
?- win_of_3rd(italy, netherlands). % False
% 2/ Did Brazil win against England in the 3rd place match?
?- win_of_3rd(brazil, england). % False
% 3/ Which team won against Netherlands in the 3rd place match?
?- win_of_3rd(X, netherlands). % False

% Test 10: penalty
% 1/ Did Croatia play Japan in a penalty shootout?
?- penalty(croatia, japan).  % True
% 2/ Did Argentina play France in a penalty shootout?
?- penalty(argentina, france).  % True
% 3/ Did Morocco play Spain in a penalty shootout?
?- penalty(morocco, spain). % True

% Test 11: count_penalty
% 1/ How many penalties were there in total?
?- count_penalty(Count). % Total penalty: 10
% 2/ How many penalty shootouts involved Croatia?
?- count_penalty(croatia). % Total penalty: 2
% 3/ How many penalty shootouts involved Argentina?
?- count_penalty(argentina). % Total penalty: 2

% Test 12: teams_in_group
% 1/ What teams are in group A? 
?- teams_in_group(a, Teams). % Teams = [qatar, ecuador, senegal, netherlands].
% 2/ What teams are in group B?
?- teams_in_group(b, Teams). % Teams = [england, iran, usa, wales].
% 3/ What teams are in group E?
?- teams_in_group(e, Teams). % Teams = [spain, costa_rica, germany, japan].

% Test 13: qualified_from_group
% 1/ Which teams qualified from group A?
?- qualified_from_group(a, Team1, Team2).
/* Team1 = netherlands;
   Team2 = senegal */
% 2/ Is Argentina one of the teams that qualified from group C?
?- qualified_from_group(c, argentina, _). % True
% 3/ Is Morocco one of the teams that qualified from group F?
?- qualified_from_group(f, morocco, _). % True

% Test 14: round_of_16_match
% 1/ Did Netherlands play USA in Round of 16?
?- round_of_16_match(netherlands, usa). % True
% 2/ Did France play Poland in Round of 16?
?- round_of_16_match(france, poland). % True
% 3/ Who played against Brazil in Round of 16?
?- round_of_16_match(brazil, X). % X = south_korea.

% Test 15: qualified_for_quarterfinals
% 1/ Is Argentina qualified for the quarterfinals?
?- qualified_for_quarterfinals(argentina). % True
% 2/ Is France qualified for the quarterfinals?
?- qualified_for_quarterfinals(france). % True
% 3/ Is Brazil qualified for the quarterfinals?
?- qualified_for_quarterfinals(brazil). % True

% Test 16: possible_quarterfinals_match
% 1/ Can Argentina play against France in the quarterfinals?
?- possible_quarterfinals_match(argentina, france). % True
% 2/ Can Brazil play against Portugal in the quarterfinals?
?- possible_quarterfinals_match(brazil, portugal). % True
% 3/ Can Croatia play against Morocco in the quarterfinals?
?- possible_quarterfinals_match(croatia, morocco). % True

% Test 17: qualified_for_semifinals
% 1/ Is Argentina qualified for the semifinals?
?- qualified_for_semifinals(argentina). % True
% 2/ Is Croatia qualified for the semifinals?
?- qualified_for_semifinals(croatia). % True
% 3/ Is Brazil qualified for the semifinals?
?- qualified_for_semifinals(brazil). % False

% Test 18: possible_semifinals_match
% 1/ Can Argentina play against Croatia in the semifinals?
?- possible_semifinals_match(argentina, croatia). % True
% 2/ Can France play against Brazil in the semifinals?
?- possible_semifinals_match(france, brazil). % False
% 3/ Can Portugal play against Morocco in the semifinals?
?- possible_semifinals_match(portugal, morocco). % False

% Test 19: qualified_for_final
% 1/ Is Argentina qualified for the final?
?- qualified_for_final(argentina). % True
% 2/ Is France qualified for the final?
?- qualified_for_final(france). % True
% 3/ Is Brazil qualified for the final?
?- qualified_for_final(brazil). % False

% Test 20: final_match
% 1/ Did Argentina play against France in the final?
?- final_match(argentina, france). % True
% 2/ Did Croatia play against Brazil in the final?
?- final_match(croatia, brazil). % False
% 3/ Did Portugal play against Morocco in the final?
?- final_match(portugal, morocco). % False

% Test 21: champion
% 1/ Is Argentina the champion?
?- champion(argentina). % True
% 2/ Is France the champion?
?- champion(france). % False
% 3/ Is Brazil the champion?
?- champion(brazil). % False

% Test 22: eliminated_in_groupstage
% 1/ Is Qatar eliminated in the group stage?
?- eliminated_in_groupstage(qatar). % True
% 2/ Is Senegal eliminated in the group stage?
?- eliminated_in_groupstage(senegal). % False
% 3/ Is Italy eliminated in the group stage?
?- eliminated_in_groupstage(italy). % False

% Test 23: eliminated_in_round_of_16
% 1/ Is USA eliminated in the Round of 16?
?- eliminated_in_round_of_16(usa). % True
% 2/ Is Netherlands eliminated in the Round of 16?
?- eliminated_in_round_of_16(netherlands). % False
% 3/ Is Brazil eliminated in the Round of 16?
?- eliminated_in_round_of_16(brazil). % False

% Test 24: eliminated_in_quarterfinals
% 1/ Is England eliminated in the quarterfinals?
?- eliminated_in_quarterfinals(england). % True
% 2/ Is Argentina eliminated in the quarterfinals?
?- eliminated_in_quarterfinals(argentina). % False
% 3/ Is France eliminated in the quarterfinals?
?- eliminated_in_quarterfinals(france). % False

% Test 25: eliminated_in_semifinals
% 1/ Is Croatia eliminated in the semifinals?
?- eliminated_in_semifinals(croatia). % True
% 2/ Is Morocco eliminated in the semifinals?
?- eliminated_in_semifinals(morocco). % False
% 3/ Is Brazil eliminated in the semifinals?
?- eliminated_in_semifinals(brazil). % False

% Test 26: lose_final
% 1/ Did Croatia lose in the final?
?- lose_final(croatia). % False
% 2/ Did Morocco lose in the final?
?- lose_final(morocco). % False
% 3/ Did Argentina lose in the final?
?- lose_final(argentina). % False

% Test 27: runner_up
% 1/ Is France the runner-up?
?- runner_up(france). % True
% 2/ Is Croatia the runner-up?
?- runner_up(croatia). % False
% 3/ Is Brazil the runner-up?
?- runner_up(brazil). % False

% Test 28: place_3rd
% 1/ Did Croatia place 3rd?
?- place_3rd(croatia). % True
% 2/ Did Morocco place 3rd?
?- place_3rd(morocco). % False
% 3/ Did Brazil place 3rd?
?- place_3rd(brazil). % False

% Test 29: play_against
% 1/ Did Argentina play against France?
?- play_against(argentina, france).  % True
% 2/ Did Brazil play against Croatia?
?- play_against(brazil, croatia). % True
% 3/ Did Portugal play against Morocco?
?- play_against(portugal, morocco). % True

% Test 30: teams_defeated_by
% 1/ Which teams were defeated by Argentina?
?- teams_defeated_by(argentina, Teams). % Teams = [australia, netherlands, croatia, france].
% 2/ Which teams were defeated by Croatia?
?- teams_defeated_by(croatia, Teams). % Teams = [japan, brazil].
% 3/ Which teams were defeated by France?
?- teams_defeated_by(france, Teams). % Teams = [poland, england, morocco].

