CREATE DATABASE chatSys;
USE chatSys;
//用户表
CREATE TABLE userTable(
userid VARCHAR(15) PRIMARY KEY,
upassword VARCHAR(20),
userstatus INT
);
//用户信息表
CREATE TABLE userInfo(
userid VARCHAR(15) PRIMARY KEY,
username VARCHAR(10),
usersign VARCHAR(100),	//用户签名
ctime DATE,	//账号创建时间
birth DATE,
address VARCHAR(100),
FOREIGN KEY userInfo(userid) REFERENCES userTable(userid) ON UPDATE CASCADE
   ON DELETE RESTRICT
);
//聊天信息
CREATE TABLE chatInfo(
sendid VARCHAR(15) PRIMARY KEY,	//发送人id
receiveid VARCHAR(15),	//接收人id
chattime DATE,	//聊天时间
message VARCHAR(100),	//消息
FOREIGN KEY chatInfoSend(sendid) REFERENCES userTable(userid) ON UPDATE CASCADE
   ON DELETE RESTRICT,
   FOREIGN KEY chatInfoReceive(receiveid) REFERENCES userTable(userid)
);
//未处理的消息（当接收方未上线时暂存于此，上线后获取值并删除）
CREATE TABLE unprocessedMessage(
sendid VARCHAR(15) PRIMARY KEY,
receiveid VARCHAR(15),
stime DATE,
message VARCHAR(100),
FOREIGN KEY unprocessedMessageSend(sendid) REFERENCES userTable(userid) ON UPDATE CASCADE
   ON DELETE RESTRICT,
   FOREIGN KEY unprocessedMessageReceive(receiveid) REFERENCES userTable(userid)
);
//好友表
CREATE TABLE frientInfo(
userid VARCHAR(15) PRIMARY KEY,	//用户id
friendid VARCHAR(15),	//好友id
friendName VARCHAR(10) REFERENCES userInfo(username), //好友姓名
FOREIGN KEY friendInfo(userid) REFERENCES userTable(userid) ON UPDATE CASCADE
   ON DELETE RESTRICT,
   FOREIGN KEY friendInfoFriend(friendid) REFERENCES userTable(userid)
)