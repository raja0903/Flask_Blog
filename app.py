from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
# import MySQLdb
import json
# from flask_mail import Mail, Message


with open('templates\config.json','r') as c:
    params=json.load(c)["params"]

local_server=params['local_server']

app=Flask(__name__)
app.secret_key='super-secret-key'

# mail1 = Mail(app) # instantiate the mail class

# configuration of mail
# app.config['MAIL_SERVER']='smtp.gmail.com'
# app.config['MAIL_PORT'] = 465
# app.config['MAIL_USERNAME'] = params['gmail_user']
# app.config['MAIL_PASSWORD'] = params['gmail_password']
# # app.config['MAIL_USE_TLS'] = False
# app.config['MAIL_USE_SSL'] = True
# mail1 = Mail(app)



if local_server==True:
    app.config["SQLALCHEMY_DATABASE_URI"] = params["local_uri"]
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params["prod_uri"]

db = SQLAlchemy(app)

class Posts(db.Model):
    sno=db.Column(db.Integer,primary_key=True)
    title = db.Column(db.String(80))
    slug = db.Column(db.String(25), unique=True)
    content = db.Column(db.String(120))
    

class Contacts(db.Model):
    name = db.Column(db.String(80))
    phone = db.Column(db.String(12), unique=True)
    mail = db.Column(db.String(120), unique=True)
    message=db.Column(db.String(120))
    sno=db.Column(db.Integer,primary_key=True)


@app.route("/")
def home():
    
    posts=Posts.query.filter_by().all()
    last=len(posts)//int(params["no_of_post"])
    #pagination logic
    page=request.args.get('page')
    if not str(page).isnumeric():
        page=1
    page=int(page)
    if page==1:
        prev="#"
        next='/?page='+str(page+1)    
    elif page==last:
        next="#"
        prev='/?page='+str(page-1)
    else:
        next='/?page='+str(page+1) 
        prev='/?page='+str(page-1)  

    posts=posts[(page-1)*int(params["no_of_post"]):(page-1)*int(params["no_of_post"])+int(params["no_of_post"])]
    return render_template('index.html',params=params,posts=posts,prev=prev,next=next)



@app.route("/dashboard",methods=['GET','POST'])
def dashboard():
    if 'user' in session and session['user']==params['admin']:
        posts=Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)
    if request.method=='POST':
        username=request.form.get('uname')
        pswd=request.form.get('upswd')
        if username==params['admin'] and pswd==params['admin_password']:
            # set session
            session['user']=username
            posts=Posts.query.all()
            return render_template('dashboard.html',params=params,posts=posts)
    
    else:
        return render_template('signin.html',params=params)

@app.route("/about")
def about():
    return render_template('about.html',params=params)


@app.route("/delete/<string:sno>")
def delete(sno):
    print(True)
    if 'user' in session and session['user']==params['admin']:
        post=Posts.query.filter_by(sno=sno).first()
        print(post)
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/logout")
def logout():
    # Clear the user's session data
    session.clear()
    # Redirect the user to a login or home page
    return redirect('/dashboard')  # Change 'login' to the appropriate route name for your login page





@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if 'user' in session and session['user']==params['admin']:
        
        if request.method=='POST':
            req_title=request.form.get('title')
            req_content=request.form.get('content')
            req_slug=request.form.get('slug')
            
            
            
            if sno=='0':
                post=Posts(title=req_title,slug=req_slug,content=req_content)
                db.session.add(post)
                db.session.commit()
                
                return redirect('/edit/'+sno)

            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=req_title
                post.content=req_content
                post.slug=req_slug
                db.session.commit()
        post=Posts.query.filter_by(sno=sno).first()    
        
        return render_template('edit.html',post=post,params=params)
        

    


@app.route("/contact" ,methods=['GET','POST'])
def contact():
    if request.method=='POST':
        name=request.form.get('name')
        phone=request.form.get('phone')
        mail=request.form.get('mail')
        message=request.form.get('message')
        entry=Contacts(name=name,mail=mail,phone=phone,message=message)
        db.session.add(entry)
        db.session.commit()
        
        # msg = Message(
		# 		'Hello',
		# 		sender =mail,
		# 		recipients = [params['gmail_user']]
		# 	)
        # msg.body = f'Hello , message received from {name}'
        # mail1.send(msg)
    return render_template('contact.html',params=params)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post=Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=post)

app.run(debug=True)