package com.peachs.mapper;

import java.util.List;

import com.peachs.entity.AccountsInfo;

public interface AccountsInfoMapper {
	
	public List<AccountsInfo> getLists();
	
//	로그인
	public AccountsInfo login(AccountsInfo loginuser);
	
//	회원가입
	public void register(AccountsInfo mvo);
}
