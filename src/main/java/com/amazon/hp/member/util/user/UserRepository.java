package com.amazon.hp.member.util.user;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	User findByEmail(String email);
	User findByEmailAndProviderId(String email, String providerId);

}
