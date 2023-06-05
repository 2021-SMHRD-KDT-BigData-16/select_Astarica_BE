package com.peachs.mapper;

import java.util.List;

import com.peachs.entity.AccountsInfo;
import com.peachs.entity.OriginDataInfo;

public interface OriginDataInfoMapper {
	
	public List<OriginDataInfo> getLists(AccountsInfo user);
	
	public void insert(OriginDataInfo data);
}
