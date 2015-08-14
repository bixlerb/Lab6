#LAB6 Python starter code
#imports go here
#import MySQLdb
import _mysql

#code goes here

buffer = "true"



def oneQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="caleb123",db="games")
	db.query("""SELECT * FROM games;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def twoQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="caleb123",db="games")
	db.query("""SELECT * FROM gameRatings;""")
	r = db.store_result()
	nR = r.num_rows()
	while(nR > 0):
		print(r.fetch_row())
		nR = nR - 1
	db.close()

def threeQuery():
	db = _mysql.connect(host="localhost",user="root",passwd="caleb123",db="games")
	db.query("""SELECT rating FROM gameRatings WHERE ratingID not in (select ratingID from games)""")
	r = db.store_result()
	nR = r.num_rows()
	if nR>0:
		while(nR > 0):
			print(r.fetch_row())
			nR = nR - 1
	else:
		if nR == 0:
			print("""all ratings have been used""")
	db.close()
	
while buffer:
	print("""
	0.Exit
	1.See games
	2.See ratings
	3.See if a rating hasn't been used on a game
	""")
	buffer=input("what would you like to do? ")
	if buffer == 1:
		oneQuery()
	if buffer == 2:
		twoQuery()
	if buffer == 3:
		threeQuery()