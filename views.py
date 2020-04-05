from flask import *
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import sqlite3
import random

app=Flask(__name__)
app.secret_key = "abc"
conn = sqlite3.connect('cricket.db')

@app.route('/')
def front():
    return render_template('new.html')

@app.route('/questions')
def question():
    return render_template('question.html')

@app.route('/teams/<team>')
def teams(team):
    wanted=request.args.get('wanted')
    conn = sqlite3.connect('cricket.db')
    c=conn.cursor()
    if(wanted=="schedule"):
        c.execute("select * from matches where team_a='"+team+"' or team_b='"+team+"';")
        c=list(map(lambda x:list(x),c))
        print(c)
        return jsonify(c)
    elif(wanted=="players"):
        c.execute("select * from players where board IN (select name from board where country='"+team+"')")
        c=list(map(lambda x:list(x),c))
        print(c)
        return jsonify(c)
    elif(wanted=="board"):
        c.execute("select * from board where country='"+team+"';")
        c=list(map(lambda x:list(x),c))
        print(c)
        return jsonify(c)
    elif(wanted=="country"):
        c.execute("select * from country where name='"+team+"';")
        c=list(map(lambda x:list(x),c))
        print(c)
        return jsonify(c)
    return render_template("teams.html")
@app.route('/schedule')
def schedule():
    conn = sqlite3.connect('cricket.db')
    c=conn.cursor()
    c.execute("select * from matches;")
    print(c)
    return render_template("schedule.html",data=c)

@app.route('/signup',methods=["GET","POST"])
def signup():
    if(request.method=="GET"):
        return render_template("signup.html")
    elif(request.method=="POST"):
        try:
            data=request.form
            conn = sqlite3.connect('cricket.db')
            c=conn.cursor()
            c.execute("insert into signup values('"+data['emailId']+"','"+data['FN']+"','"+data['LN']+"','"+data['password']+"','"+data['phone']+"','"+data['gender']+"');")
            conn.commit()
            return redirect('/signin')
        except:
            return render_template('signup.html',data="Username Already Exists")

@app.route('/signin',methods=["GET","POST"])
def signin():
    if request.method=="GET":
        return render_template("signin.html")
    else:
        data=request.form
        conn = sqlite3.connect('cricket.db')
        c=conn.cursor()
        c.execute("select * from signup where email='"+data['emailId']+"' and password='"+data['password']+"';")
        c=list(c)
        print(c)
        if(len(c)>0):
            session['emailId']=data['emailId']
            session['FN']=c[0][1]
            session['LN']=c[0][2]
            msg="SignIn Successfull"
            return redirect(url_for('front',msg=msg))
        else:
            return render_template('signin.html',data="Username and password does not match")

@app.route('/signout',methods=["GET"])
def signout():
    session.clear()
    return redirect(url_for('front',msg="Signed Out"))


@app.route('/success')
def success():
    ticket_no=request.args.get('ticket_no')
    return render_template('success.html',ticket_no=ticket_no)

@app.route('/ticket/<match_no>',methods=["GET","POST"])
def ticket(match_no):
    amount={'A':3999,'B':2999,'C':1999}
    if request.method=="GET":
        conn = sqlite3.connect('cricket.db')
        c=conn.cursor()
        c.execute("select * from matches where match_no="+match_no+";")
        c=list(c)
        return render_template('ticket.html',data=c[0])
    else:
        ticket_no=random.randrange(100000,999999)
        form=request.form
        conn = sqlite3.connect('cricket.db')
        c=conn.cursor()
        c.execute("insert into ticket values("+str(ticket_no)+","+str(match_no)+",'"+session['emailId']+"',"+str(form['number'])+",'"+form['area']+"',"+str(int(form['number'])*amount[form['area']])+");")
        for i in range(int(form['number'])):
            c.execute("insert into peoples values('"+form['FN'+str(i)]+"','"+form['LN'+str(i)]+"','"+form['gender'+str(i)]+"',"+str(form['age'+str(i)])+","+str(ticket_no)+");")
        conn.commit()
        if c:
            return redirect(url_for('success',ticket_no=str(ticket_no)))
        else:
            return "Something went wrong"

@app.route('/showTicket/<ticket_no>')
def showTicket(ticket_no):
    a={}
    conn = sqlite3.connect('cricket.db')
    c=conn.cursor()
    c.execute("select * from ticket where number="+ticket_no+";")
    a['ticket']=list(c)
    c.execute("select * from peoples where ticket="+ticket_no+";")
    a['peoples']=list(c)
    c.execute("select * from signup where email='"+session['emailId']+"';")
    a['by']=list(c)
    c.execute("select * from matches where match_no IN (select match from ticket where number="+ticket_no+")")
    a['match']=list(c)
    return render_template("ShowTicket.html",data=a)

@app.route('/cancel/<ticket_no>')
def cancel(ticket_no):
    conn = sqlite3.connect('cricket.db')
    c=conn.cursor()
    c.execute("select * from ticket where number="+ticket_no+";")
    d=list(c)
    if d[0][2]==session['emailId']:
        c.execute("delete from peoples where ticket="+ticket_no+";")
        c.execute("delete from ticket where number="+ticket_no+";")
        conn.commit()
        return "<script>alert('Deleted Successfull');window.location.assign('/');</script>"
    else:
        return "<script>alert('Can not Delete');window.location.assign('/');</script>"

@app.route('/dashboard',methods=["GET","POST"])
def dasboard():
    conn = sqlite3.connect('cricket.db')
    c=conn.cursor()
    if request.method=="GET":
        try:
            if(session['emailId']):
                if(request.args.get("wanted")=="form"):
                    c.execute("select * from signup where email='"+session['emailId']+"';")
                    c=list(c)[0]
                    print("here")
                    return jsonify(c)
                d={}
                c.execute("select number from ticket where email='"+session['emailId']+"';")
                d['ticket_no']=list(map(lambda x:x[0],c))
                return render_template('dashboard.html',data=d)
        except Exception as e:
            print(e)
            return redirect('/signin')
    elif request.method=="POST":
        data=request.get_json()
        c.execute("update signup set fname='"+data['FN']+"', lname='"+data['LN']+"', phone='"+data['phone']+"', gender='"+data['gender']+"' where email='"+session['emailId']+"';")
        conn.commit()
        c.execute("select * from signup where email='"+session['emailId']+"';")
        c=list(c)[0]
        return jsonify(c)

@app.route('/editPassword',methods=["POST"])
def dashoardForm():
    conn = sqlite3.connect('cricket.db')
    c=conn.cursor()
    data=request.get_json()
    c.execute("select * from signup where email='"+session['emailId']+"' and password='"+data['old']+"';")
    if(len(list(c))>0):
        c.execute("update signup set password='"+data['new']+"' where email='"+session['emailId']+"';" )
        conn.commit()
        return {}
    else:
        abort(400)

if __name__=="__main__":
	app.run(port=5678,debug=True)
