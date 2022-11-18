#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#truncar dados
#echo $($PSQL "TRUNCATE teams, games")

#inserir times
cat games.csv | while IFS="," read year round winner opponent winner_goals opponent_goals
do
  if [[ $year != "year" ]]
  then
    # ADD TO TEAMS
    echo $($PSQL"INSERT INTO teams(name) SELECT('$winner') WHERE NOT EXISTS(SELECT name FROM teams WHERE name = ('$winner'))")
    echo $($PSQL"INSERT INTO teams(name) SELECT('$opponent') WHERE NOT EXISTS(SELECT name FROM teams WHERE name = ('$opponent'))")

    #echo $($PSQL"INSERT INTO teams(name) VALUES('$winner')")
    #echo $($PSQL"INSERT INTO teams(name) VALUES('$opponent')")

    # ADD TO GAMES
    # find teams IDs
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")

    # insert into table games
    echo $($PSQL"INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals)")
  fi
  # if not, add it
done 
