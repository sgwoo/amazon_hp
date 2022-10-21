package com.amazon.hp.member.util.user;

import javax.persistence.Entity;

public class UserEmailFormatter {
    
    private String subject;
    private String sql;
    private int rejectSlistIdx = 0;
    private int blockGroupIdx = 0;
    private String mailFrom = "\"아마존카\"<sales@amazoncar.co.kr>";
    private String mailTo;
    private String replyTo = "\"아마존카\"<sales@amazoncar.co.kr>";
    private String errorsTo = "\"아마존카\"<dev@amazoncar.co.kr>";
    private int html = 1;
    private int encoding = 0;
    private String charset = "euc-kr";
    private String sDate;
    private String tDate;
    private int durationSet = 1;
    private int clickSet = 0;
    private int siteSet = 0;
    private int atcSet = 0;
    private String gubun;
    private String rName = "mail";
    private int mType = 0;
    private int uIdx = 1;
    private int gIdx = 1;
    private int msgFlag = 1;
    private String content;
    
    //test
    
    public UserEmailFormatter(String subject, String sql, int rejectSlistIdx, int blockGroupIdx, String mailFrom,
            String mailTo, String replyTo, String errorsTo, int html, int encoding, String charset, String sDate,
            String tDate, int durationSet, int clickSet, int siteSet, int atcSet, String gubun, String rName,
            int mType, int uIdx, int gIdx, int msgFlag, String content) {
        super();
        this.subject = subject;
        this.sql = sql;
        this.rejectSlistIdx = rejectSlistIdx;
        this.blockGroupIdx = blockGroupIdx;
        this.mailFrom = mailFrom;
        this.mailTo = mailTo;
        this.replyTo = replyTo;
        this.errorsTo = errorsTo;
        this.html = html;
        this.encoding = encoding;
        this.charset = charset;
        this.sDate = sDate;
        this.tDate = tDate;
        this.durationSet = durationSet;
        this.clickSet = clickSet;
        this.siteSet = siteSet;
        this.atcSet = atcSet;
        this.gubun = gubun;
        
        this.rName = rName;
        this.mType = mType;
        this.uIdx = uIdx;
        this.gIdx = gIdx;
        this.msgFlag = msgFlag;
        this.content = content;
    }
    public UserEmailFormatter() {
        
    }    
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getSql() {
        return sql;
    }
    public void setSql(String sql) {
        this.sql = sql;
    }
    public int getRejectSlistIdx() {
        return rejectSlistIdx;
    }
    public void setRejectSlistIdx(int rejectSlistIdx) {
        this.rejectSlistIdx = rejectSlistIdx;
    }
    public int getBlockGroupIdx() {
        return blockGroupIdx;
    }
    public void setBlockGroupIdx(int blockGroupIdx) {
        this.blockGroupIdx = blockGroupIdx;
    }
    public String getMailFrom() {
        return mailFrom;
    }
    public void setMailFrom(String mailFrom) {
        this.mailFrom = mailFrom;
    }
    public String getMailTo() {
        return mailTo;
    }
    /*public void setMailTo(String mailTo) {
        this.mailTo = mailTo;
    }*/
    
    public void setMailTo(String mailTo) {
        String emailId = mailTo.split("@")[0];
        this.mailTo = "\"" + emailId + "\"" + "<" + mailTo + ">";
    }
    public String getReplyTo() {
        return replyTo;
    }
    public void setReplyTo(String replyTo) {
        this.replyTo = replyTo;
    }
    public String getErrorsTo() {
        return errorsTo;
    }
    public void setErrorsTo(String errorsTo) {
        this.errorsTo = errorsTo;
    }
    public int getHtml() {
        return html;
    }
    public void setHtml(int html) {
        this.html = html;
    }
    public int getEncoding() {
        return encoding;
    }
    public void setEncoding(int encoding) {
        this.encoding = encoding;
    }
    public String getCharset() {
        return charset;
    }
    public void setCharset(String charset) {
        this.charset = charset;
    }
    public String getsDate() {
        return sDate;
    }
    public void setsDate(String sDate) {
        this.sDate = sDate;
    }
    public String gettDate() {
        return tDate;
    }
    public void settDate(String tDate) {
        this.tDate = tDate;
    }
    public int getDurationSet() {
        return durationSet;
    }
    public void setDurationSet(int durationSet) {
        this.durationSet = durationSet;
    }
    public int getClickSet() {
        return clickSet;
    }
    public void setClickSet(int clickSet) {
        this.clickSet = clickSet;
    }
    public int getSiteSet() {
        return siteSet;
    }
    public void setSiteSet(int siteSet) {
        this.siteSet = siteSet;
    }
    public int getAtcSet() {
        return atcSet;
    }
    public void setAtcSet(int atcSet) {
        this.atcSet = atcSet;
    }
    public String getGubun() {
        return gubun;
    }
    public void setGubun(String gubun) {
        this.gubun = gubun;
    }
    public String getrName() {
        return rName;
    }
    public void setrName(String rName) {
        this.rName = rName;
    }
    public int getmType() {
        return mType;
    }
    public void setmType(int mType) {
        this.mType = mType;
    }
    public int getuIdx() {
        return uIdx;
    }
    public void setuIdx(int uIdx) {
        this.uIdx = uIdx;
    }
    public int getgIdx() {
        return gIdx;
    }
    public void setgIdx(int gIdx) {
        this.gIdx = gIdx;
    }
    public int getMsgFlag() {
        return msgFlag;
    }
    public void setMsgFlag(int msgFlag) {
        this.msgFlag = msgFlag;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    
}
