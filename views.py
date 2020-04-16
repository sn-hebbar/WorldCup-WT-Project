from flask import *
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import sqlite3
import random
import yaml
import glob
from math import ceil,floor
import pprint
import time 

app=Flask(__name__)
app.secret_key = "abc"
conn = sqlite3.connect('cricket.db')
start=0
now=0
count=0
a=list()
initial=list()
final=list()
park=0
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
    return render_template("teams.html",team=team)
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
            return render_template('signup.html',data="Email Id Already Exists")

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

@app.route('/live',methods=["GET"])
def live():
    wick=0
    global count
    global initial
    global final
    global a
    global start
    global now
    tot=0
    with open('static/data/IndvsAus2020.yaml') as file:
    # The FullLoader parameter handles the conversion from YAML
    # scalar values to Python the dictionary format
        fruits_list = yaml.load(file, Loader=yaml.FullLoader)
        det1=fruits_list['info']
        dat1=det1['dates'][0]
        match=det1['match_type']
        outcome_wick=det1['outcome']['by']['wickets']
        outcome_winner=det1['outcome']['winner']
        player=det1['player_of_match'][0]
        playteams=det1['teams']
        toss=det1['toss']['winner']
        opt=det1['toss']['decision']
        umpires=det1['umpires']
        venue=det1['venue']
        initial.append(dat1)#0
        initial.append(match)#1
        final.append(outcome_winner+" won by "+str(outcome_wick)+" wickets ")
        final.append("Man of the match : "+player)
        initial.append(playteams)#2
        initial.append(toss)#3
        initial.append(opt)#4
        initial.append(umpires)#5
        initial.append(venue)#6
        f1=fruits_list['innings'][0]['1st innings']['deliveries'][0][0.1]['batsman']
        f2=fruits_list['innings'][0]['1st innings']['deliveries'][0][0.1]['non_striker']
        over=list()
        a=[]
        temp=list()
        for i in fruits_list['innings'][0]['1st innings']['deliveries']:
            for j in i.keys():
                temp=list()
                if((f1!=i[j]['batsman'])and(f1!=i[j]['non_striker'])):
                    wick=wick+1
                    f1=i[j]['batsman']
                elif((f2!=i[j]['batsman'])and(f2!=i[j]['non_striker'])):
                    wick=wick+1
                    f2=i[j]['non_striker']
                k=list()
                temp.append(i[j]['batsman'])
                temp.append(i[j]['non_striker'])
                temp.append(i[j]['runs']['batsman'])
                temp.append(i[j]['runs']['extras'])
                temp.append(tot+i[j]['runs']['total'])
                tot=tot+i[j]['runs']['total']
                temp.append(wick)
                temp.append(j)
                temp.append(ceil(j))
                temp.append("1st innings")
            a.append(temp)
        a.append([0,0,0,0,tot,wick,19.6,20.0,'1st innings over !!!'])
        tot=0
        wick=0
        f1=fruits_list['innings'][1]['2nd innings']['deliveries'][0][0.1]['batsman']
        f2=fruits_list['innings'][1]['2nd innings']['deliveries'][0][0.1]['non_striker']
        for i in fruits_list['innings'][1]['2nd innings']['deliveries']:
            for j in i.keys():
                temp=list()
                if((f1!=i[j]['batsman'])and(f1!=i[j]['non_striker'])):
                    wick=wick+1
                    f1=i[j]['batsman']
                elif((f2!=i[j]['batsman'])and(f2!=i[j]['non_striker'])):
                    wick=wick+1
                    f2=i[j]['non_striker']
                k=list()
                temp.append(i[j]['batsman'])
                temp.append(i[j]['non_striker'])
                temp.append(i[j]['runs']['batsman'])
                temp.append(i[j]['runs']['extras'])
                temp.append(tot+i[j]['runs']['total'])
                tot=tot+i[j]['runs']['total']
                temp.append(wick)
                temp.append(j)
                temp.append(ceil(j))
                temp.append('2nd innings')
            a.append(temp)
        return render_template("livescores.html")

@app.route("/livescores",methods=["GET"])
def livescores():
    global a
    global count
    global start
    global now
    now=time.time()
    diff=int((now-start)/5)
    start=now
    if(diff>1):
        count=count+diff
    if(count>=len(a)):
        return jsonify(['-','-',0,0,0,0,0,0,"2nd innings over!!!"])
    b=a[count]
    count=count+1
    start=time.time()
    return jsonify(b)

@app.route("/livescoresinitial",methods=["GET"])
def livescoresinitial():
    global initial
    return jsonify(initial)

@app.route("/livescoresfinal",methods=["GET"])
def livescoresfinal():
    global final
    return jsonify(final)

@app.route('/stat')
def stat():
    return render_template('stat.html')

@app.route('/pie')
def pie():
    matches = {'pakistan': 36, 'Sri Lanka': 78, 'South Africa': 52, 'Bangladesh': 32, 'West Indies': 66, 'New Zealand': 42, 'Australia': 78, 'England': 69, 'Afghanistan': 4} 

    won = {'pakistan': 24, 'Sri Lanka': 51, 'South Africa': 28, 'Bangladesh': 27, 'West Indies': 44, 'New Zealand': 23, 'Australia': 38, 'England': 39, 'Afghanistan': 4}

    colors = ["#F7464A", "#46BFBD", "#FDB45C", "#FEDCBA", "#ff0000", "#fd3100", "#cde310", "#F0FFFF","#d30121"]

    res = {}
    res = dict((k, float(won[k]) / matches[k]) for k in won)
    labels = res.keys()
    values = res.values()
    return render_template('pie_chart.html', title='India matches won against other countries',  set=zip(values, labels, colors),set1=zip(matches.values(),labels,colors))

@app.route('/bar')
def bar():
    labels = [
        'V Kohli', 'M S Dhoni', 'R G Sharma', 'A T Rayadu',
        'S Dhawan'
    ]

    values = [
        59.34, 50.38, 49.27, 47.06,
        45.14
    ]

    colors = [
        "#F7464A", "#46BFBD", "#FDB45C", "#FEDCBA",
        "#ABCDEF"
    ]
    bar_labels=labels
    bar_values=values
    return render_template('bar_chart.html', title='TOP 5 HIGHEST BATTING IN ONE DAY INTERNATIONAL', max=65, labels=bar_labels, values=bar_values)

@app.route('/line_chart')
def line():
    with open('static/data/IndvsAus2020.yaml') as file:
    # The FullLoader parameter handles the conversion from YAML
    # scalar values to Python the dictionary format
        score_list = yaml.load(file, Loader=yaml.FullLoader)
        sc=0
        for i in score_list['innings'][0]['1st innings']['deliveries']:
            for j in i.keys():
                sc+=i[j]['runs']['total']
        print(sc)
            
        a={}
        for i in score_list['innings'][0]['1st innings']['deliveries']:
            for j in i.keys():
                if ceil(j/5)*5 in a:
                    a[ceil(j/5)*5]+=i[j]['runs']['total']
                else:
                    a[ceil(j/5)*5]=i[j]['runs']['total']
        print(a)
        for i in a:
            if i-5 not in a:
                a[i]=a[i]
            else:
                a[i]=a[i]+a[i-5]
        #print(a.keys())
        #print(a.values())
        b={}
        for i in score_list['innings'][1]['2nd innings']['deliveries']:
            for j in i.keys():
                if ceil(j/5)*5 in b:
                    b[ceil(j/5)*5]+=i[j]['runs']['total']
                else:
                    b[ceil(j/5)*5]=i[j]['runs']['total']
        print(b)
        for i in b:
            if i-5 not in b:
                b[i]=b[i]
            else:
                b[i]=b[i]+b[i-5]
    team1=score_list['innings'][0]['1st innings']['team']
    team2=score_list['innings'][1]['2nd innings']['team']
    info=score_list['info']
    labels = a.keys()
    labels1 = b.keys()
    values = a.values()
    values1 = b.values()
    print(labels, values,labels1,values1)
    return render_template('line3.html', title='Line chart', max=25, set = zip(labels, values), set1 = zip(labels1,values1),
                            team1=team1,team2=team2,info=info)

@app.route('/about')
def about():
    return render_template('about.html')

if __name__=="__main__":
    start=time.time()
    app.run(port=5679,debug=True)
