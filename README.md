These are SQL files developed when creating Football Data Warehouse in PostreSQL
Below is a general description of the tables:
1. Key Tables and Relationships (High-Level Overview) - tables relationships in parenthesis 
- games:	A single football match (this can be paired with clubs, competitions)
- clubs:	Each football club	(this can be paired with games, club_games, players)
- players:	Individual players	(this can be paired with games, appearances, valuations, game_events)
- competitions:	Tournaments or leagues	(this can be paired with games, players)
- club_games:	Club-level view of each game (by team)	(this can be paired with clubs, games)
- appearances:	Player appearances in games	(this can be paired with players, games, clubs)
- game_events:	Detailed in-game events (goals, assists, etc.)	(this can be paired with games, players, clubs)
- player_valuations:	Historical player market values	(this can be paired with players, clubs, competitions)

2. Diagram Symbols Explanation
- Each box is a table
- Columns with gold key = Primary Key
- Lines between tables represent Foreign Key relationships
- Each arrow points from a foreign key (child) to a primary key (parent) - Ex; games.home_club_id points to clubs.club_id
- Solid line = enforced foreign key constraint

