import asyncio, os
import hypercorn.asyncio
from flask import *
from asgiref.wsgi import WsgiToAsgi
from hypercorn.config import Config
from telethon import *
import sqlite3, hmac, hashlib
import requests
import requests as req 
import os, requests, math, time, urllib3
import json
import datetime

bot_start_time = datetime.datetime.now()

apiKey = "G8aAmEzqMWDav7hyfy2AiNlomJK6SgS5k4gaxMf"
privateKey = "BGcGf-rV8SY-SZ8TV-1oRW-BLxNE"
merchant_ref = "Agn"
merchant_code = "T24086"
expiry = int(time.time() + (24*60*60)) # 24 jam
LOGS = -1002220747235 # ID GRUP
HTTP_TIMEOUT = 60
app = Flask(__name__)
aapp = WsgiToAsgi(app)
config = Config()
config.bind = ["0.0.0.0:3001"]

class TimeoutRequestsSession(requests.Session):
    def request(self, *args, **kwargs):
        kwargs.setdefault('timeout', HTTP_TIMEOUT)
        return super(TimeoutRequestsSession, self).request(*args, **kwargs)

requests = TimeoutRequestsSession()
requests.headers.update({"AUTH_KEY":"meki"})
import datetime as DT
import sqlite3, base64,json, re
token = "7457114586:AAHjeY41CCBNRg4tbfbl2nJjqqgpJljCgEY"
bot = TelegramClient("kodokganteng","15995433","6fc6fd0c77e5494c14724442abe46e5e").start(bot_token=token)

try:
	open("agin/mmk.db")
except:
	x = sqlite3.connect("agin/mmk.db")
	sc = f"""
CREATE TABLE user (
		saldo INTEGER NOT NULL DEFAULT 0,
		member INTEGER,
		email TEXT,
		created TEXT,
		counted INTEGER DEFAULT 0
		);
"""
	sc1 = f"""
CREATE TABLE vmess (
		harga7 INTEGER,
		harga INTEGER,
		quota INTEGER,
		limitip INTEGER,
		buttonname TEXT,
		domain INTEGER,
		counted INTEGER DEFAULT 0,
		limcounted INTEGER
		);
"""
	sc2 = f"""
CREATE TABLE vless (
		harga7 INTEGER,
		harga INTEGER,
		quota INTEGER,
		limitip INTEGER,
		buttonname TEXT,
		pubkey TEXT,
		domain INTEGER,
		counted INTEGER DEFAULT 0,
		limcounted INTEGER
		);
"""
	sc4 = f"""
CREATE TABLE trojanws (
		harga7 INTEGER,
		harga INTEGER,
		quota INTEGER,
		limitip INTEGER,
		buttonname TEXT,
		domain INTEGER,
		counted INTEGER DEFAULT 0,
		limcounted INTEGER
		);
"""
	sc3 = f"""
CREATE TABLE trojango (
		harga INTEGER,
		buttonname TEXT,
		domain INTEGER,
		counted INTEGER DEFAULT 0,
		limcounted INTEGER
		);
"""
	sc5 = f"""
CREATE TABLE trojangfw (
		harga INTEGER,
		buttonname TEXT,
		domain INTEGER,
		counted INTEGER DEFAULT 0,
		limcounted INTEGER
		);
"""
	sc6 = f"""
CREATE TABLE ssh (
		harga7 INTEGER,
		harga INTEGER,
		limitip INTEGER,
		portdb TEXT,
		portwstls TEXT,
		portwsntls TEXT,
		link TEXT,
		buttonname TEXT,
		pubkey TEXT,
		ns TEXT,
		domain INTEGER,
		counted INTEGER DEFAULT 0,
		limcounted INTEGER
		);
"""
	sc7 = f"""
CREATE TABLE tripay (
		sign TEXT
		);
"""
	
	x.executescript(sc)
	x.executescript(sc1)
	x.executescript(sc2)
	x.executescript(sc3)
	x.executescript(sc4)
	x.executescript(sc5)
	x.executescript(sc6)
	x.executescript(sc7)
	c = x.cursor() 
	c.execute("CREATE TABLE admin (user_id INTEGER NOT NULL);") 
	c.execute("INSERT INTO admin (user_id) VALUES (?)",("6465475379",))
	c.execute("INSERT INTO admin (user_id) VALUES (?)",("669121410",))
	#c.execute("INSERT INTO admin (user_id) VALUES (?)",("618371769",))
	
	x.commit()

async def sbot():
	await bot.start(bot_token=token)
	print("client started")
	await hypercorn.asyncio.serve(aapp, config)

def get_uptime():
    current_time = datetime.datetime.now()
    uptime = current_time - bot_start_time
    formatted_uptime = str(uptime).split('.')[0]  # Remove milliseconds
    return formatted_uptime
	
def cs(size_bytes):
   if size_bytes == 0:
       return "0B"
   size_name = ("B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")
   i = int(math.floor(math.log(size_bytes, 1024)))
   p = math.pow(1024, i)
   s = round(size_bytes / p, 2)
   return "%s %s" % (s, size_name[i])


def members():
	member = get_db().execute("SELECT member FROM user").fetchall()
	print(member)
	member = len([x[0] for x in member])
	return member

for x in ["/start","/hello"]:
	@bot.on(events.NewMessage(pattern=x))
	async def hello(event):
		x = await event.get_sender()
		msg = f"""
**━━━━━━━━━━━━━━━━**
**» Name:** `{x.first_name}`
**» Username:** `@{x.username}`
**» User ID:** `{x.id}`
**━━━━━━━━━━━━━━━━**
**» Menu:** [ /menu ]
**» 👤Member: **`{members()}`
**━━━━━━━━━━━━━━━━**
"""
		await event.respond(msg)
		
def get_db():
	x = sqlite3.connect("agin/mmk.db")
	x.row_factory = sqlite3.Row
	return x

def minus(member,saldo,val):
	db = get_db()
	db.execute("UPDATE user SET saldo = ? WHERE member = ?",
	(int(val["saldo"])-int(saldo),member,))
	db.commit()
uptime = "Unknown"

def domains():
	domain = get_db().execute("SELECT domain FROM vmess").fetchall()
	print(domain)
	domain = len([x[0] for x in domain])
	return domain
	
def domainstr():
	domain = get_db().execute("SELECT domain FROM trojanws").fetchall()
	print(domain)
	domain = len([x[0] for x in domain])
	return domain
	
def namas():
	xx = get_db().execute("SELECT buttonname FROM vmess").fetchall()
	print(xx)
	xx = ([x[0] for x in xx])
	if xx:
		print(xx)
		return xx
		
def hargas():
	xx1 = get_db().execute("SELECT harga FROM vmess").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1

def hargass():
	xx1 = get_db().execute("SELECT harga7 FROM vmess").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1
		
def namash():
	xx = get_db().execute("SELECT buttonname FROM ssh").fetchall()
	print(xx)
	xx = ([x[0] for x in xx])
	if xx:
		print(xx)
		return xx
		
def hargash():
	xx1 = get_db().execute("SELECT harga FROM ssh").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1

def hargassh():
	xx1 = get_db().execute("SELECT harga7 FROM ssh").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1
		
def namastrws():
	xx = get_db().execute("SELECT buttonname FROM trojanws").fetchall()
	print(xx)
	xx = ([x[0] for x in xx])
	if xx:
		print(xx)
		return xx
		
def hargastrws():
	xx1 = get_db().execute("SELECT harga FROM trojanws").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1

def namavless():
	xx = get_db().execute("SELECT buttonname FROM vless").fetchall()
	print(xx)
	xx = ([x[0] for x in xx])
	if xx:
		print(xx)
		return xx

def hargavless():
	xx1 = get_db().execute("SELECT harga FROM vless").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1

def hargavlesss():
	xx1 = get_db().execute("SELECT harga7 FROM vless").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1
		
def namasgfw():
	xx = get_db().execute("SELECT buttonname FROM trojangfw").fetchall()
	print(xx)
	xx = ([x[0] for x in xx])
	if xx:
		print(xx)
		return xx
		
def hargasgo():
	xx1 = get_db().execute("SELECT harga FROM trojango").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1
		
def namasgo():
	xx = get_db().execute("SELECT buttonname FROM trojango").fetchall()
	print(xx)
	xx = ([x[0] for x in xx])
	if xx:
		print(xx)
		return xx
		
def hargasgfw():
	xx1 = get_db().execute("SELECT harga FROM trojangfw").fetchall()
	print(xx1)
	xx1 = ([x[0] for x in xx1])
	if xx1:
		print(xx1)
		return xx1
		
def valid(id):
	db = get_db()
	x = db.execute("SELECT saldo, member, email FROM user WHERE member = (?)",(id,)).fetchone()
	if not x:
		return "false"
	else:
		return {"saldo":x[0],"member":x[1],"email":x[2]}
		
async def notifpay(data, event):
	db = get_db()
	count = db.execute("SELECT counted FROM user").fetchone()[0]
	db.execute("UPDATE user SET counted = (?)", (int(count) + 1,))
	db.commit()
	print(data)
	msg = f"""
**━━━━━━━━━━━━━━━━**
**⟨ New TopUp [Instan Tripay] ⟩**
**━━━━━━━━━━━━━━━━**
**» TopUp counts:** `{count}`
**» Email:** `{data["email"]}`
**» Balance:** `{data["balance"]}`
**━━━━━━━━━━━━━━━━**
"""
	await event.client.send_message(LOGS, msg)

async def notifs(data,event):
	db = get_db()
#	valdi = db.exexute("SELECT bool FROM notif").fetchone()[0]
#	if valdi == "true":
	count = db.execute("SELECT counted FROM user").fetchone()[0]
	db.execute("UPDATE user SET counted = (?)",(int(count)+1,))
	db.commit()
	print(data)
#	data = json.loads(data)
	msg = f"""
**━━━━━━━━━━━━━━━━**
**⟨⚡️ New Transactions ⚡️⟩**
**━━━━━━━━━━━━━━━━**
**» Transactions Count:** `{count}`
**» Email Reseller:** `{data["email"]}`
**» Server:** `{data["server"]}`
**» Protocol:** `{data["protocol"]}`
**» Expiry:** `{data["exp"]}`
**━━━━━━━━━━━━━━━━**
"""
	await event.client.send_message(LOGS,msg)
	
async def notifstrr(data,event):
	db = get_db()
#	valdi = db.exexute("SELECT bool FROM notif").fetchone()[0]
#	if valdi == "true":
	count = db.execute("SELECT counted FROM user").fetchone()[0]
	db.execute("UPDATE user SET counted = (?)",(int(count)+1,))
	db.commit()
	print(data)
#	data = json.loads(data)
	msg = f"""
**━━━━━━━━━━━━━━━━**
**⟨⚡️ New Trial Transactions ⚡️⟩**
**━━━━━━━━━━━━━━━━**
**» Transactions Count:** `{count}`
**» Email Reseller:** `{data["email"]}`
**» Server:** `{data["server"]}`
**» Protocol:** `{data["protocol"]}`
**» Expiry:** `{data["exp"]}`
**━━━━━━━━━━━━━━━━**
"""
	await event.client.send_message(LOGS,msg)

@bot.on(events.NewMessage(pattern=r"(?:.free|free|/join)$"))
async def free(event):
    sender = await event.get_sender()
    if not sender.username:
        await event.reply("**Anda harus memiliki nama pengguna untuk mendaftar!**")
        return

    async def free_(event):
        email = str(sender.username) + "@aginvpn.net"
        db.execute("INSERT INTO user (saldo, member, email) VALUES (?,?,?)",
                   ("5", sender.id, email,))
        db.commit()
        await event.reply(f"""
**━━━━━━━━━━━━━━━━**
**Sukses Terdaftar!**
**━━━━━━━━━━━━━━━━**
**» Name:** `{sender.first_name}`
**» Username:** @{sender.username}
**» User ID:** `{sender.id}`
**━━━━━━━━━━━━━━━━**
**» Menu:** [ /menu ]
**» 👥Member: **`{members()}/500`
**━━━━━━━━━━━━━━━━**
""", buttons=[[Button.inline(" MENU ", "menu")]])

    val = valid(sender.id)
    db = get_db()
    x = db.execute("SELECT * FROM admin").fetchall()
    a = [v[0] for v in x]
    if sender.id not in a and val == "false":
        if members() >= 500:
            await event.reply("**Slot Free sudah Full!**")
        else:
            await free_(event)
    else:
        await event.reply("**Anda Sudah Terdaftar!**")

@bot.on(events.NewMessage(pattern="(?:/bcast)"))
async def bcast(event):
    db = get_db()
    memberz = [x[0] for x in db.execute("SELECT member FROM user").fetchall()]
    
    async def bcast_(event, res):
        if event.is_reply:
            msg = await event.get_reply_message()
            try:
                await bot.send_message(res, msg)  # Menggunakan 'bot' sebagai klien untuk mengirim pesan
                return True  # Berhasil mengirim pesan
            except Exception as e:
                print(f"Broadcast ke user {res} gagal: {e}")
                return False  # Gagal mengirim pesan

        else:
            await event.respond("**Reply To Message, File, Media, Images, Or Sticker!**")
            return False  # Gagal mengirim pesan karena tidak ada pesan balasan

    x = db.execute("SELECT user_id FROM admin").fetchall()
    a = [v[0] for v in x]
    sender = await event.get_sender()
    if sender.id in a:
        if event.is_reply:
            msg = await event.get_reply_message()
            success_count = 0
            for res in memberz:
                success = await bcast_(event, res)
                if success:
                    success_count += 1
            
            await event.respond(f"**Berhasil Broadcast ke** `{str(success_count)}/{str(len(memberz))}` **Reseller**")
        else:
            await event.respond("**Reply To Message, File, Media, Images, Or Sticker!**")
    else:
        await event.respond("**Akses Ditolak**")






