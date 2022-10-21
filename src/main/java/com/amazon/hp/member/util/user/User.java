package com.amazon.hp.member.util.user;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

  
    @Entity
    
    @Table(name = "mobile_member", schema = "amazoncar")
    @DynamicInsert
    @DynamicUpdate
    public class User implements Serializable {
    
    	@Id
//    	@SequenceGenerator(sequenceName="MOBILE_MEMBER_SEQ", allocationSize=1, name = "SequenceIdGenerator", schema = "amazoncar")
    	@SequenceGenerator(sequenceName="amazoncar.MOBILE_MEMBER_SEQ", allocationSize=1, name = "SequenceIdGenerator")
    	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SequenceIdGenerator")
    	@Column(name="seq", insertable = false, updatable = false)
    	private int id;
    
    	@Column(name="c_name", length = 20)
    	private String name;
    
    	@Column(name = "email", length = 50)
    	private String email;
    
    	@Column(name = "passwd", length = 255)
    	private String password;

		@Column(name = "provider", length = 100)
		private String providerId;

		@Column(name = "fms_id", length = 20)
		private String fmsid;

		@Column(name = "use_yn", length = 1)
		private String useYN;

		@CreationTimestamp
		@Column(name = "first_access")
		private Date firstAccessDate;

		@Column(name = "tel", length = 30)
		private String tel;

		@Column(name = "birth", length = 8)
		private String birth;
		
		//추가
		@Column(name = "fb_id", length = 50)
		private String fb_id;
		
		//추가
		@Column(name = "kakao_id", length = 50)
		private String kakao_id;
		
		@Column(name = "reg_dt", length = 8)
		private String reg_dt;

		public int getId() {
    		return id;
    	}
    
    	public void setId(int id) {
    		this.id = id;
    	}
    
    	public String getName() {
    		return name;
    	}
    
    	public void setName(String name) {
    		this.name = name;
    	}
    
    	public String getEmail() {
    		return email;
    	}
    
    	public void setEmail(String email) {
    		this.email = email;
    	}
    
    	public String getPassword() {
    		return password;
    	}
    
    	public void setPassword(String password) {
    		this.password = password;
    	}

    	public String getProviderId() {
    		return providerId;
		}

		public void setProviderId(String providerId) {
    		this.providerId = providerId;
		}

		public String getTel() {
			return tel;
		}

		public void setTel(String tel) {
			this.tel = tel;
		}

		public String getBirth() {
			return birth;
		}

		public void setBirth(String birth) {
			this.birth = birth;
		}
		
		//추가
		public String getFb_id() {
			return fb_id;
		}

		public void setFb_id(String fb_id) {
			this.fb_id = fb_id;
		}
		
		//추가
		public String getKakao_id() {
			return kakao_id;
		}
		
		public void setKakao_id(String kakao_id) {
			this.kakao_id = kakao_id;
		}
		
		public String getReg_dt() {
			return reg_dt;
		}

		public void setReg_dt(String reg_dt) {
			this.reg_dt = reg_dt;
		}

		public User() {	
		  
			/*if(getProviderId()!= null && !getProviderId().equals("")){
				if(getProviderId().equals("facebook") && getEmail() == null){	//facebook 회원가입이고 email 정보는없는경우					
					this.useYN = "H";
				}else{	//구글 회원가입 or 페북 회원가입이더라도 email정보 있는 경우					
					this.useYN = "Y";
				}				
			}else{	//일반 회원가입인 경우				
				this.useYN = "H";
			}*/
			
			this.fmsid = "XXXXXX";			
		}

    	@SuppressWarnings("deprecation")
		public static User fromVO(UserCreateRequestVO userCreateRequestVO) {
    		
    		User user = new User();
    		//user.setId(userCreateRequestVO.getId());
    		user.setName(userCreateRequestVO.getName());
    		user.setEmail(userCreateRequestVO.getEmail());
    		user.setProviderId(userCreateRequestVO.getProviderId());
    		
    		if(user.getProviderId()!=null && !user.getProviderId().equals("")){
    			/*if(user.getProviderId().equals("facebook") && !user.getEmail().contains("@") && !user.getEmail().contains(".")){	//facebook 회원가입이고 email 정보는없는경우    				
    				user.useYN = "H";
				}else{	//구글 회원가입 or 페북 회원가입이더라도 email정보 있는 경우					
					user.useYN = "Y";
				}*/
    			if (user.getProviderId().equals("facebook") || user.getProviderId().equals("kakao")) {
    				user.useYN = "Y";
    			} else {
    				user.useYN = "Y";
    			}
    		}else{	//일반 회원가입인 경우    			
    			user.useYN = "H";
    		}
    		
    		//등록일 추가
    		Calendar ca 	= Calendar.getInstance();
    		String year 	= String.valueOf(ca.get(Calendar.YEAR));
    		String month 	= String.valueOf(ca.get(Calendar.MONTH)+1);
    		String date 	= String.valueOf(ca.get(Calendar.DAY_OF_MONTH));
    		if(Integer.parseInt(month)<10){		month = "0" + month;	}
    		if(Integer.parseInt(date)<10){		date  = "0" + date;		}
    		user.reg_dt = year + month + date;
    		return user;
    	}
    }
