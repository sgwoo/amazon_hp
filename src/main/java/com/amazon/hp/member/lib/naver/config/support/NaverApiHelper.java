package com.amazon.hp.member.lib.naver.config.support;

import com.amazon.hp.member.lib.naver.api.Naver;
import com.amazon.hp.member.lib.naver.api.NaverOAuth2ApiBinding;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.UserIdSource;
import org.springframework.social.config.xml.ApiHelper;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UsersConnectionRepository;

public final class NaverApiHelper implements ApiHelper<Naver> {
	private static final Logger LOG = LoggerFactory.getLogger(NaverApiHelper.class);

	private final UsersConnectionRepository usersConnectionRepository;
	private final UserIdSource userIdSource;

	private NaverApiHelper(final UsersConnectionRepository usersConnectionRepository, final UserIdSource userIdSource) {
		this.usersConnectionRepository = usersConnectionRepository;
		this.userIdSource = userIdSource;
	}

	public Naver getApi() {
		if (LOG.isDebugEnabled()) {
			LOG.debug("Getting API binding instance");
		}

		final Connection<Naver> connection = usersConnectionRepository.createConnectionRepository(userIdSource.getUserId()).findPrimaryConnection(Naver.class);
		if (connection == null) {
			if (LOG.isErrorEnabled()) {
				LOG.error("No current connection: Returning default NaverTemplate instance.");
			}
			return new NaverOAuth2ApiBinding(null);
		}
		return connection.getApi();
	}
}
