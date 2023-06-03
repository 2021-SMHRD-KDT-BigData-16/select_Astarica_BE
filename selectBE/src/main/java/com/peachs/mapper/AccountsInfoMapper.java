package com.peachs.mapper;

import java.util.List;

import com.peachs.entity.AccountsInfo;

public interface AccountsInfoMapper {
	
	public List<AccountsInfo> getLists();
	
	public AccountsInfo login(AccountsInfo loginuser);
}
