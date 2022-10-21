package com.amazon.hp.member.lib.naver.api;

import com.amazon.hp.member.lib.naver.api.abstracts.UserOperation;
import org.springframework.social.ApiBinding;

public interface Naver extends ApiBinding {
	UserOperation userOperation();
}
